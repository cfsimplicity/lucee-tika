component accessors="true"{

	static {
		version = "1.0.0";
		tikaVersion = "2.4.0";
		bundleSymbolicName = "apache-tika-app-bundle";
		bundlePath = GetDirectoryFromPath( GetCurrentTemplatePath() ) & "tika-app-#static.tikaVersion#.bundle.jar";
	}

	property name="osgiLoader";
	property name="tikaObject";

	include "iso639names.cfm";

	public function init(){
		return this
			.setOsgiLoader( New osgiLoader() )
			.setTikaObject( loadClass( "org.apache.tika.Tika" ) )
	}

	private any function loadClass( required string className ){
		return this.getOsgiLoader().loadClass(
			className: arguments.className
			,bundlePath: static.bundlePath
			,bundleSymbolicName: static.bundleSymbolicName
			,bundleVersion: static.tikaVersion
		)
	}

	public function tika(){
		return this.getTikaObject()
	}

	public string function parseToString( required string filePath ){
		try{
			var fileStream = CreateObject( "java", "java.io.FileInputStream" ).init( JavaCast( "string", filePath ) )
			var result = this.getTikaObject().parseToString( fileStream )
		}
		finally{
			fileStream.close()
		}
		return result
	}

	public struct function detectLanguage( required string input ){
		var detector = loadClass( "org.apache.tika.langdetect.optimaize.OptimaizeLangDetector" ).loadModels()
    var result = detector.detect( JavaCast( "string", arguments.input ) )
    var languageNames = iso639names()
    return {
    	code: result.getLanguage()
    	,name: languageNames[ result.getLanguage() ]
    	,isReasonablyCertain: result.isReasonablyCertain()
    }
	}
	
}