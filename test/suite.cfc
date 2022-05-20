component extends="testbox.system.BaseSpec"{

	function beforeAll(){
		variables.tika = New root.wrapper()
		variables.tempFilePath = ExpandPath( "temp.pdf" )
	}

	function run( testResults, testBox ){

		describe( "tika", ()=> {

			afterEach( function(){
				if( FileExists( tempFilePath ) )
					FileDelete( tempFilePath )
			})

			it( "can read the contents of a document", ()=> {
				document format="pdf" filename=tempFilePath{
					WriteOutput( "Test" )
				}
				expect( tika.parseToString( tempFilePath ).Trim() ).toBe( "Test" )
			})
			
			it( "can identify the language of a string", ()=> {
				var inputs = {
					en: "This is in English"
					,de: "Dies ist auf deutsch"
					,fr: "Un matin, je suis allé me promener dans la forêt."
					,es: "Esto es en español"
					,ru: "Это по русски"
				}
				for( var lang in inputs )
					expect( tika.detectLanguage( inputs[ lang ] ).code ).toBe( lang )
			})

		})

	} 

}