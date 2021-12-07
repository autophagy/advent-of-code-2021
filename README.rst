.. code-block::

         (==)                               _____   _             _
          /\                               |  _  |_| |_ _ ___ ___| |_
         /  \                              |     | . | | | -_|   |  _|
         /~~\λ                             |__|__|___|\_/|___|_|_|_|
        /λ   \                                 ___                        ___ ___ ___ ___
       /~~*~~~\                            ___|  _|                      |_  |   |_  |_  |
      λ/    λ \                           | . |  _|                      |  _| | |  _|_| |_
      /~~~~~~~~\~`                        |___|_|                        |___|___|___|_____|
     /__*_______\                          _____       _
          ||    λ                         |     |___ _| |___
        \====/                            |   --| . | . | -_|
         \__/                             |_____|___|___|___|
     

Hello! Here are my `Advent of Code 2021 <https://adventofcode.com/2021>`_
solutions. Written in Haskell, trying not to use any external libraries (except
hspec for testing) as some much needed FP practice.

Building/testing relies on
`Stack <https://docs.haskellstack.org/en/stable/README/>`_. A nix shell with
it can be instantiated using ``nix-shell``.

Building
========

To build::

  > stack build

Running a challenge
===================

One of the challenges can be computed via::

  > stack exec -- aoc2021 <x>

For example, computing day 3's challenge::

  > stack exec -- aoc2021 3

Testing
=======

To test::

  > stack test
