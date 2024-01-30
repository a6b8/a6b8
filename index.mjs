import { Generate } from './src/Generate.mjs'
import { config } from './src/data/config.mjs'

import fs from 'fs'

function getTimestamp() {
    const currentDate = new Date()
    const year = currentDate.getFullYear()
    const month = String( currentDate.getMonth() + 1 ).padStart( 2, '0' )
    const day = String( currentDate.getDate() ).padStart( 2, '0' )
    const hours = String( currentDate.getHours() ).padStart( 2, '0' )
    const minutes = String( currentDate.getMinutes() ).padStart( 2, '0' )

    const formattedDate = `${year}-${month}-${day} ${hours}:${minutes}`
    const dateString = `Last update: ${formattedDate}`

    return dateString
}



const generate = new Generate()

let result = ''
result += generate.getReadme()
result += '\n\n' + getTimestamp()

fs.writeFileSync( 
    config['readme']['output'], 
    result,
    'utf-8'
)