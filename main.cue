package main

import(
    "dagger.io/dagger"
    "universe.dagger.io/alpine"
    "universe.dagger.io/bash"
    "github.com/sierisimo/dagger-speaker/speaker"
)

me: speaker.#Speaker & {
    name: "Sier"
    username: "@Sierisimo"
    communities: ["j4G", "KUG GDL"]
    likes: ["Kotlin", "Comics", "Boardgames"]
    dislikes: ["Racism", "Authority", "Watermelon"]
}

dagger.#Plan & {
    actions: {
        _img: alpine.#Build & {
            packages: {
                bash: _
            }
        }

        hi: bash.#Run & {
            input: _img.output
            script: contents: "echo hi \(me.name)"
            always: true
        }
    }
}
