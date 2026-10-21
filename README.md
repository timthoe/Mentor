# Tacit

An AI companion that turns everyday senior–junior collaboration into lasting organisational knowledge.

Tacit follows the communication around a shared task (mail, chat, meeting transcripts), spots the moments where expertise is being applied, and:

- asks the **senior** to verbalise the decision in a few seconds, and
- nudges the **junior** to notice, predict and reflect on how the work was done.

What gets said is distilled into a living, validated knowledge base of decisions, heuristics and cases.

## Documents

1. [Concept](docs/01-concept.md): problem, idea, core loop, interventions, risks, demo direction
2. [PRD](docs/02-prd.md): consulting segment, Microsoft 365, requirements, demo script
3. [Demo](demo/): scripted, clickable 9-scene walkthrough

## Running the demo

Open `demo/index.html` in a browser. It works offline apart from web fonts, which fall back to system fonts. Use **Next** or the arrow keys to advance, `1`–`9` to jump to a scene, `N` for presenter notes and `R` to restart.

`demo/tacit-demo.html` is the source. After editing it, run `demo/build-standalone.sh` to regenerate `demo/index.html`.
