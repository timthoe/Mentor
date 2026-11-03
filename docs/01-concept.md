# Tacit: Concept

*Status: draft for discussion, to be turned into a PRD.*

## 1. The problem

Most of what makes a firm good at its work is **tacit**: why the senior rewrote the second paragraph, why this client gets a phone call instead of an email, why the analysis stopped at three scenarios. Traditionally this was passed on by apprenticeship: sitting next to someone, overhearing, being corrected. That channel is getting weaker:

- **Hybrid work** removes overhearing. The junior sees the *result* (the sent email, the final deck) but not the *reasoning*.
- **Seniors are busy.** Explaining takes time and rarely happens in the moment. Later, it's forgotten.
- **Juniors don't know what to ask.** They often don't notice that a decision was made at all. "Unknown unknowns."
- **Knowledge management fails** because it asks people to write documentation *after* the work, detached from context. Nobody does it, and what gets written is generic.
- **Knowledge leaves with people.** Retirements, churn and partner exits take judgment with them.

The knowledge is already being *applied* every day in the communication around real tasks. It just isn't being *articulated* or *noticed*.

## 2. The idea

An AI that sits in the work stream of a senior–junior pair (or a small team) working on a real task. It doesn't teach content itself. Instead it creates the **conditions for apprenticeship**:

| For the senior | For the junior |
|---|---|
| "You chose X over Y. Why, in one sentence?" | "Compare your draft to what was sent. What changed, and why do you think?" |
| Captures rationale **in the moment**, in seconds | Builds the habit of **noticing** expert moves |
| Turns intuition into reusable heuristics | Predicts first, then sees the senior's reasoning |

As a by-product, the firm gets a growing body of **validated, contextual, attributed knowledge**: decisions, rules of thumb and worked cases, tied to real work instead of abstract manuals.

### Theoretical grounding (useful for pitch credibility)

- **Cognitive apprenticeship** (Collins, Brown & Newman): *modelling, coaching, scaffolding, articulation, reflection, exploration*. Tacit's job is to make expert thinking visible (modelling), and to trigger articulation and reflection, which are exactly the steps that get skipped under time pressure.
- **SECI model** (Nonaka & Takeuchi): Tacit targets *externalisation*, the hard step of converting tacit to explicit knowledge, and does it during *socialisation* (working together) instead of after.
- **Retrieval & prediction effects:** asking a junior to predict the senior's reasoning *before* revealing it markedly improves retention compared with just reading it.

## 3. Core loop

```
 Observe  ->  Detect moment  ->  Prompt  ->  Capture  ->  Distil  ->  Resurface
 (mail,       (decision,         (senior:     (text,       (decision    (junior digest,
  chat,        correction,        verbalise;   voice        log,         next similar
  meetings)    deviation...)      junior:      memo,        heuristics,  task, onboarding)
                                  notice)      reaction)    cases)
```

### 3.1 Observe
Connect to the channels where the task happens: an email thread or folder, a Slack/Teams channel, meeting transcripts (Teams/Zoom/Meet), optionally document versions (draft vs. final). **Scoped to a task/engagement, opt-in by both people.** Not a firm-wide surveillance feed.

### 3.2 Detect "teachable moments"
Signals the AI looks for:

| Moment type | Example signal |
|---|---|
| **Decision** | "Let's go with option B", "We won't include the cost table" |
| **Correction** | Senior edits the junior's draft; redlines; "Actually, rather say…" |
| **Deviation** | Senior departs from template, standard process or the obvious choice |
| **Fast judgment** | Senior answers instantly where the junior struggled (pattern recognition) |
| **Stakeholder handling** | Tone shift, escalation, choosing a call instead of a mail, who is cc'ed |
| **"It depends"** | Senior hedges: there's a conditional rule hidden there |
| **Junior question** | An explicit question means a knowledge gap; similar ones cluster |
| **Silent moves** | Things done without comment: reordered agenda, removed a slide |

Each moment gets a type, a short summary, the source excerpt and an estimated *learning value* (so only the best few become prompts).

### 3.3 Prompt: the interventions

**Senior side: make thinking visible, at near-zero cost**
- *Micro-why:* "You moved the recommendation to page 1. One line on why?" Answerable by text, a 15-second voice note, or a pick-list ("client preference / risk / politics / standard practice / other").
- *Rule-of-thumb extraction:* "Is there a general rule here, or was this specific to this client?"
- *Counterfactual:* "What would have made you choose differently?" (surfaces the conditions of the rule)
- *Batching:* end-of-day digest of 2–3 moments rather than interruptions. "Snooze", "skip" and "not worth explaining" are first-class answers.
- *Pre-drafted rationale:* the AI proposes a guess ("Looks like you softened the tone because the client's CFO was cc'ed, right?") and the senior just confirms/corrects. Correcting is easier than writing.

**Junior side: notice, predict, reflect**
- *Notice cards:* "Three things changed between your draft and the sent version. Can you spot them?"
- *Predict-then-reveal:* "Why do you think Anna dropped the cost table?" The junior answers, *then* sees the senior's captured rationale.
- *Pattern links:* "This is the third time a deadline was pushed back via a phone call rather than email. What's the pattern?"
- *Reflection:* weekly "What did you learn about how we handle X?", plus "what would you do next time?"
- *Ask-the-senior queue:* juniors park questions; the AI clusters and deduplicates them (and answers from the knowledge base where possible), so asking becomes cheap and socially safe.

**Joint**
- *Debrief agenda:* a generated 10-minute weekly 1:1 agenda from the richest moments of the week.

### 3.4 Capture & distil
Answers become structured knowledge items:

- **Decision record:** context → options → choice → rationale → conditions
- **Heuristic:** "When the client's CFO is involved, lead with the financial impact", with provenance, scope, exceptions, and who endorsed it
- **Case:** a short narrated example linked to the original excerpt (redacted)
- **Expertise map:** who explains what well (find the right senior to ask)

Items are **draft until the senior approves** them, and can be endorsed or contested by other seniors. Knowledge carries confidence and age.

### 3.5 Resurface
- When a junior starts a similar task: "Last time on a CFO-heavy steering deck, these three heuristics applied."
- In onboarding paths for new hires
- Spaced repetition of the junior's own reflections

## 4. Who it's for

**Best-fit firms:** knowledge-intensive professional services built on leverage (seniors + juniors): consulting, law, audit/advisory, engineering, architecture, also internal expert functions (finance, procurement, public sector case handling).

| Persona | Wants | Fears |
|---|---|---|
| **Junior** (0–3 yrs) | Learn faster, understand *why*, feel safe asking | Being judged, being monitored |
| **Senior** (manager/partner) | Juniors who need less correction; leverage | Time cost, being second-guessed, surveillance |
| **Firm / L&D / KM lead** (buyer) | Faster time-to-competence, retained knowledge, consistency | Privacy/legal exposure, low adoption |

## 5. Design principles

1. **Seconds, not minutes, for seniors.** If a prompt takes more than ~20 seconds to answer, it's too heavy.
2. **Ask, don't tell.** The AI is Socratic. It builds the junior's judgment and avoids becoming an oracle that creates dependence.
3. **Human-validated knowledge.** Nothing enters the shared base without the source senior's approval.
4. **Learning, never evaluation.** Data is not used to rate performance. This is stated, enforced technically, and visible to users.
5. **Scoped & consented.** Per task, opt-in by both, easy pause, clear view of what the AI can see.
6. **Provenance everywhere.** Every knowledge item links back to who said it and in what (redacted) context.
7. **Fewer, better prompts.** 2–3 high-value moments a day beat 20 mediocre ones.

## 6. Risks & how to address them

| Risk | Mitigation |
|---|---|
| Feels like surveillance | Opt-in per task, transparent "what I saw" log, junior and senior both can pause, no manager dashboards on individuals |
| Legal: GDPR, EU AI Act (AI used in employment *evaluation* is high-risk), works councils / *samarbejdsudvalg* | Explicit non-evaluation purpose, data minimisation, retention limits, DPIA, EU hosting, involve employee representatives early |
| Client confidentiality | Redaction before storage, knowledge stored as abstracted heuristics, client-level access walls |
| Prompt fatigue for seniors | Learning-value ranking, batching, daily cap, pre-drafted rationales, "skip" without guilt |
| Post-hoc rationalisation (seniors invent reasons) | Ask close to the moment; capture conditions and exceptions; let other seniors contest |
| Encoding bad habits | Peer endorsement, KM review for items that get promoted firm-wide |
| AI misreads situations | Always phrased as a question / hypothesis, never as fact; easy "wrong, here's what happened" |

## 7. Product surfaces (eventual)

- **Teams/Slack bot** for prompts and quick replies (incl. voice notes)
- **Outlook/Gmail add-in** to mark a thread as a "Tacit task"
- **Meeting integration:** post-meeting moments from transcripts
- **Web app:** junior learning journal, senior approval inbox, knowledge base, debrief agendas

## 8. MVP vs. later

| MVP (pilot with ~5 pairs) | Later |
|---|---|
| One stack (e.g. Microsoft 365: Outlook + Teams + transcripts) | Multi-stack, document diffing in Word/PowerPoint |
| Moment detection + senior micro-why + junior predict-then-reveal | Expertise map, cross-team pattern mining |
| Daily digest delivery | Real-time in-flow nudges |
| Personal + pair knowledge, senior-approved | Firm-wide promoted knowledge with KM curation |
| Manual task scoping | Automatic task detection |

## 9. How we'd know it works

- **Senior response rate** to prompts and **median time-to-answer** (target: >50%, <30 s)
- **Junior engagement:** predict-then-reveal completion; quality of predictions improving over time (convergence with senior rationale = growing judgment)
- **Knowledge yield:** approved items per pair per week; reuse/views when resurfaced
- **Outcome proxies:** fewer correction rounds on junior drafts; fewer repeated questions; self-rated confidence; time-to-autonomy on task types
- **Trust:** % of users who keep it on after the pilot

## 10. Demo direction (for the artefact)

A **scripted, clickable 3–5 minute story** shows the value better than a live integration. Suggested shape:

- **Scenario:** a consultancy. Senior manager *Anna* and analyst *Jonas* prepare a client steering-committee update over two days: an email thread with the client, a Teams chat, a meeting transcript, and Jonas's draft vs. the version Anna sent.
- **Screen layout:** left, the communication stream playing out; centre, Tacit highlighting detected moments; right, toggle between **Anna's view** (micro-why cards, one-tap answers, pre-drafted rationale) and **Jonas's view** (notice cards, predict-then-reveal); bottom/side, the **knowledge base** filling up with approved heuristics.
- **Beats:**
  1. Jonas's draft email → Anna rewrites it → Tacit spots 3 changes.
  2. Anna gets: "You moved the ask to the first line and removed the apology. Why?" Anna confirms a pre-drafted rationale in one tap and adds a voice note.
  3. Jonas gets: "Spot the 3 changes. Why do you think?" → answers → reveal of Anna's reasoning.
  4. In the meeting transcript Anna says "it depends who's in the room" → Tacit extracts a conditional heuristic and asks Anna to state the conditions.
  5. End of week: debrief agenda + knowledge base with 4 approved heuristics; a month later a new junior starting a similar task gets them surfaced.
- **AI in the demo:** pre-scripted by default (reliable), with an optional live mode where the Claude API generates prompts from pasted text, for the "it's real" moment.

## 11. Open questions for the PRD

1. **Target segment** for the first version: consulting, law, audit, engineering, or internal corporate teams?
2. **Buyer & demo audience:** who is the demo for (investors, a specific firm, L&D/KM leaders, internal innovation board)?
3. **Tech stack assumption:** Microsoft 365 or Google Workspace / Slack?
4. **Language:** English, Danish, or both in the demo?
5. **Scope of observation:** pairs only, or small teams (1 senior : several juniors)?
6. **Demo AI:** fully scripted, or include a live Claude-powered mode?
7. **Name:** decided: **Tacit** (see PRD §14).
