#!/bin/bash

log "Preparing to Atom packages via apm"
ruby -e '%w{
autocomplete-go
builder-go
environment
figletify
git-plus
go-plus
language-chef
language-hcl
language-puppet
language-terraform
language-viml
linter
linter-foodcritic
linter-puppet
minimap
navigator-godef
pretty-json
}.each do |c|
  cmd = "apm install #{c}"
  %x( #{cmd} )
end'
