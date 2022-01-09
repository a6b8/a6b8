const puppeteer = require('puppeteer')
const fs = require( 'fs' )


async function page( url ) {
    const browser = await puppeteer.launch()
    const page = await browser.newPage()

    let errors = []
    page.on( 'response', ( res ) => {
        if( res.status() !== 200 ) {
            let url = res._url

            inside = [ '.svg', '.png', '.jpg' ]
                .map( ( a ) => { return url.endsWith( a ) } )
                .includes( true )

            inside ? errors.push( url ) : ''
        }
    } )

    await page.goto( url )
    await browser.close()
    return errors
}


( async () => {
    let silent = false

    let tabs = '    '
    let file = fs.readFileSync( './__generate/struct/repositories.json' )
    let json = JSON.parse( file )

    let gh_user = json['meta']['github_user']
    let urls = json['projects'].map( ( project ) => {
        str = `https://github.com/${gh_user}/${project['github']}`
        return str
    } )

    l = Math.max( ...json['projects'].map( ( project ) => { return project[['github']].length } ) ) + 3
    emojis = {
        'success': '🟩',
        'error': '🟥'
    }

    console.log( '  - Visit Website' )
    silent ? console.log( `${tabs}NR    NAME` ) : ''
    for( let i = 0; i < urls.length; i++ ) {
        let name = urls[ i ].split( '/' ).pop()

        let tmp = new Array( ( 4 - ( i + '' ).length ) )
        space = tmp.fill( ' ' ).join( '' )

        tmp = new Array( ( l - name.length ) )
        space2 = tmp.fill( ' ' ).join( '' )

        let errors = await page( urls[ i ] )
        emoji = errors === 0 ? emojis['success'] : emojis['error']

        silent ? console.log( `${tabs}[${i}]${space}${name}${space2}${emoji}` ) : ''
        errors.forEach( ( str ) => { 
            silent ? console.log( `${tabs}      - ${str.split('/').pop()}` ) : ''
        } )
    }

    silent ? console.log : ''
    Object.keys( emojis ).forEach( ( key ) => { 
        silent ? console.log( `${tabs}${emojis[ key ]} ${key}` ) : ''
    } )
} )()