import fs from 'fs'
import { config } from './src/data/config.mjs'
import { reposConfig } from './src/data/repos-config.mjs'
import { BadgeTable } from './node_modules/badgetable/src/BadgeTable.mjs'
const btg = new BadgeTable()

const generate = ( { entries, templatePath, outputPath } ) => {
    const result = entries
        .reduce( ( acc, { preset, projects, replace } ) => {
            const badgeTable = btg
                .getTable( { preset, projects } )
                .replace( 'This table is generated using https://github.com/a6b8/badgeTable', '' )
            acc = acc.replace( replace, badgeTable )

            return acc
        }, fs.readFileSync( templatePath, 'utf-8' ) )

    fs.writeFileSync( outputPath, result, 'utf-8' )
    console.log( `${outputPath} updated successfully.` )
}

generate( { entries: config, templatePath: './src/data/template.txt', outputPath: './README.md' } )
generate( { entries: reposConfig, templatePath: './src/data/repos-template.txt', outputPath: './REPOS.md' } )
