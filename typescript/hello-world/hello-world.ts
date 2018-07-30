class HelloWorld {
	static hello( name?: string ) {
		var greetings = "Hello, World!"
		if (name != undefined ) {
			greetings = `Hello, ${ name }`
		}
		return greetings
	}
}

export default HelloWorld