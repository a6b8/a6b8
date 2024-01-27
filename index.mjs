import { Generate } from './src/Generate.mjs'
import { config } from './src/data/config.mjs'

import fs from 'fs'

const generate = new Generate()
const result = generate.getReadme()

fs.writeFileSync( 
    config['readme']['output'], 
    result,
    'utf-8'
)