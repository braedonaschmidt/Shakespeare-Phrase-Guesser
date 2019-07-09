# Shakespeare-Phrase-Guesser
My first simple **machine learning** project based on *The Coding Train's* Tutorial.

## Description
This is just a very simple **Processing** project that generates a population of strings that try to reach a target phrase. It uses the **Genetic Algorithm** to progress. And the fitness is determined by 2^(number of characters in the correct position).
> So if we have "xar," and we're trying to generate the phrase "car," we'd have a fitness of 2^(2) because the 'a' and the 'r' are in the correct place.

## Features I Might Add Later
This was just meant to be a project to get my feet wet with **machine learning**, but I might use it as an opportunity to work on my **Processing** skills. Don't count on me updating this further though since it's so trivial.
* **Slider bar to adjust speed** (it's already present, but it doesn't control the speed, and the sliding is pretty jank)
* **Space bar pause**
* **Graphs and other visuals/statistics**
* **Better pool selection** (currently it generates an array of every possible parent, with an amount of spots dependent on the fitness, but this can get really large really quickly; this is what *Shiffman* did)
