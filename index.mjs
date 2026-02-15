import fs from 'fs'
import { config } from './src/data/config.mjs'
import { BadgeTable } from './node_modules/badgetable/src/BadgeTable.mjs'
const btg = new BadgeTable()

let template = fs.readFileSync( './src/data/template.txt', 'utf-8' )

const strs = config
    .reduce( ( acc, { preset, projects, replace } ) => {
        const badgeTable = btg
            .getTable( { preset, projects } )
            .replace( 'This table is generated using https://github.com/a6b8/badgeTable', '' )
        acc = acc.replace( replace, badgeTable )
        return acc
    }, template )

fs.writeFileSync( './README.md', strs, 'utf-8' )
console.log( 'README.md updated successfully.' )
