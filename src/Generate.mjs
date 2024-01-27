import fs from 'fs'
import { config } from './data/config.mjs'
import { sections } from './data/sections.mjs'
import { BadgeTable } from 'badgetable'


export class Generate {
    #config
    #template
    #badgetable


    constructor() {
        this.#config = config
        this.#template = fs.readFileSync( 
            this.#config['readme']['template'], 
            'utf8'
        )

        this.#badgetable = new BadgeTable()

        return true
    }


    getReadme() {
        const result = [
            'inDevelopment',
            'legacy'
        ]
            .reduce( ( acc, key, index ) => {
                const search = this.#config['readme']['sections'][ key ]
                console.log( '>', search )
                let table = ''
                table += this.#getTableGroup( { key } )
                acc = acc.replace( search, table )
                return acc
            }, this.#template )


        return result
    }


    #getTableGroup( { key } ) {
        const tables = Object
            .entries( sections[ key ] )
            .map( ( a, index, all ) => {
                const [ k, value ] = a
                const { title, preset, projects } = value
                const footer = ( all.length -1 === index ) ? true : false
                return this.#getTable( { title, footer, preset, projects } )
            } )
            .join( "\n" )

        return tables
    }


    #getTable( { title, footer, preset, projects } ) {
        let table = ''
        table += `### ${title}\n  `
        table += this.#badgetable.getTable( {
            preset,
            projects, 
            'sort': true, 
            footer, 
            'header': false
        } )
 
        return table
    }
}