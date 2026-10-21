# Mentor: Product Requirements Document

*Version 0.1 · Draft · Working name "Mentor" (see §14 for alternatives)*

| | |
|---|---|
| **Segment** | Management & strategy consulting |
| **Stack** | Microsoft 365 (Outlook, Teams, Teams meetings, SharePoint/OneDrive) |
| **Language** | English |
| **Next deliverable** | Scripted, clickable demo (see §12) |
| **Builds on** | [01-concept.md](01-concept.md) |

---

## 1. Summary

Mentor is an AI companion for consulting teams. It follows the communication around a real engagement task in Microsoft 365: client email, Teams chat, meeting transcripts and document versions. It picks out the moments where a senior applies judgment, and then does two things:

1. It asks the **senior** to put the reasoning into words, which takes seconds and is often just confirming a suggested rationale.
2. It prompts the **junior** to notice the move, predict the reasoning, and compare their prediction with the senior's.

The answers turn into a validated library of decisions, heuristics and cases. That library resurfaces when the next team does similar work.

## 2. Problem

Consulting runs on a leverage model in which juniors learn judgment by working alongside managers and partners. That apprenticeship is breaking down:

- **Reasoning is invisible.** Analysts see the final deck or the sent email. They don't see why the storyline was reordered, why a number was left out, or why the client got a call instead of a mail.
- **No time to explain.** Engagement managers run several workstreams. Explanations get postponed and then forgotten.
- **Hybrid work** has removed overhearing: the team room, the cab ride, the partner on the phone.
- **Knowledge management fails** because the knowledge is captured after the fact. Proposal libraries hold artefacts, not judgment.
- **Expensive ramp-up.** Analysts take 12–24 months to become reliably autonomous, and attrition is high. Every departure takes judgment with it.

**Opportunity:** the judgment is already being exercised in M365 every day. Mentor captures it at the point of use and at almost no cost to the senior.

## 3. Goals and non-goals

### Goals
| # | Goal | Measure (pilot) |
|---|---|---|
| G1 | Capture senior rationale at near-zero cost | ≥ 50% of prompts answered; median answer time ≤ 30 s |
| G2 | Build juniors' ability to notice and reason about expert moves | ≥ 70% of notice cards completed; prediction–rationale agreement trending up over 8 weeks |
| G3 | Produce reusable, trusted knowledge | ≥ 3 senior-approved knowledge items per pair per week |
| G4 | Reduce correction cycles | Fewer senior rewrite rounds on junior drafts (baseline vs. week 8) |
| G5 | Be trusted | ≥ 80% of pilot users choose to keep Mentor on after the pilot |

### Non-goals
- **No performance evaluation.** Mentor gives no ratings, rankings or manager dashboards about individuals. This is a hard product constraint, not just a policy.
- Mentor does not replace formal training, staffing or appraisal processes.
- Mentor does not generate client deliverables. It is not a copilot for producing work.
- No firm-wide passive monitoring. Mentor only sees tasks that people explicitly opt in.
- No support for Google Workspace or Slack in v1.

## 4. Users and personas

| Persona | Role | Needs | Concerns |
|---|---|---|---|
| **Jonas, Analyst / Associate** (0–3 yrs) | Drafts slides, emails, analyses; takes meeting notes | Understand *why*; learn faster; safe way to ask | Being watched or judged; extra workload |
| **Anna, Engagement Manager** (5–10 yrs) | Reviews and rewrites junior work; owns client communication | Juniors who need fewer corrections; leverage; recognition as a coach | Time cost; interruptions; having casual remarks recorded |
| **Partner** | Client relationship, final calls | Firm consistency; developing future managers | Client confidentiality |
| **L&D / Knowledge lead** (buyer) | Owns capability building and KM | Faster time-to-competence; living knowledge base; adoption | GDPR, works council, low usage |
| **IT / Security** (gatekeeper) | Approves M365 apps | Least-privilege permissions, EU data residency, auditability | Broad Graph permissions, data leaving the tenant |

## 5. Key concepts

- **Mentor Task:** a scoped unit of work, such as "SteerCo #3 deck for Halvorsen Logistics". It has members (at least one senior and one junior), linked sources (mail threads, a Teams chat or channel, meetings, files) and a start and end date. Mentor only observes inside Tasks.
- **Moment:** a detected teachable event inside a Task, with a type, summary, source excerpt, involved people and a learning-value score.
- **Prompt:** a question delivered to a senior (a Why card) or a junior (a Notice card).
- **Knowledge Item:** a distilled output, either a *Decision*, a *Heuristic* or a *Case*. It is in Draft until the senior approves it, and is then Shared at the Task, Practice or Firm level.

### Moment taxonomy (consulting)
| Type | Consulting example |
|---|---|
| Storyline / framing | Recommendation moved to slide 1; "lead with the so-what" |
| Content cut | Removed a chart, a number or a caveat from the deck |
| Client communication | Tone change, removing an apology, who is cc'ed, call instead of email |
| Scope / commercial | Pushing back on a client request; handling change requests |
| Stakeholder politics | "Pre-wire the CFO before SteerCo" |
| Analytical judgment | Choice of approach, stopping rule, sanity checks |
| Conditional rule | "It depends who's in the room" |
| Junior question | Explicit question that reveals a gap |

## 6. User stories

**Setup**
- US-1: As an EM, I can create a Mentor Task from a Teams chat or Outlook thread in under a minute and invite my analyst.
- US-2: As any member, I can see exactly which sources Mentor watches, and I can pause or leave at any time.

**Senior**
- US-3: As an EM, I get at most 3 Why cards per day, bundled at a time I choose.
- US-4: As an EM, I can answer a Why card by confirming or editing a suggested rationale, picking a reason tag, or recording a ≤ 30 s voice note.
- US-5: As an EM, I can skip a card ("not worth explaining" or "private"), and nothing is stored when I do.
- US-6: As an EM, I approve, edit or reject each draft Knowledge Item before anyone else sees it.
- US-7: As an EM, when I say "it depends", Mentor asks me for the conditions and turns the answer into an if/then heuristic.

**Junior**
- US-8: As an analyst, after my draft is revised, I get a Notice card: "Spot what changed and guess why."
- US-9: As an analyst, I enter my prediction before the senior's rationale is revealed, and I see how they compare.
- US-10: As an analyst, I can park questions in an Ask queue. Mentor answers from approved knowledge where it can and bundles the rest for my EM.
- US-11: As an analyst, I keep a private learning journal of my reflections, notes and the items I've saved.
- US-12: As an analyst starting a new Task, I'm shown relevant approved heuristics, for example for a SteerCo deck with a CFO audience.

**Pair**
- US-13: As a pair, we get a generated 10-minute weekly debrief agenda built from the week's richest moments.

**Knowledge lead**
- US-14: As a knowledge lead, I can review items nominated for Practice- or Firm-level sharing and curate them. I see aggregate usage only.

## 7. Functional requirements

Priority: **P0** = pilot must-have, **P1** = pilot nice-to-have, **P2** = later.

### 7.1 Tasks and consent
| ID | Requirement | Pri |
|---|---|---|
| F-1 | Create a Task from Teams (message extension) or Outlook (add-in) and link sources: mail conversation IDs, a Teams chat or channel, calendar meetings, SharePoint files | P0 |
| F-2 | Every member must actively accept before any data from the Task is processed | P0 |
| F-3 | Members can pause, leave or delete; deleting a Task purges raw excerpts within 24 h | P0 |
| F-4 | A "What Mentor saw" transparency log per Task | P0 |
| F-5 | External (client) participants' content is used only as context, never stored verbatim, and redacted | P0 |

### 7.2 Ingestion (Microsoft Graph)
| ID | Requirement | Pri |
|---|---|---|
| F-6 | Mail: subscribe to linked conversation threads (Graph change notifications) | P0 |
| F-7 | Teams chat or channel messages for linked chats | P0 |
| F-8 | Teams meeting transcripts for linked meetings, after the meeting | P0 |
| F-9 | Document versions (Word/PowerPoint in SharePoint/OneDrive): diff the junior's draft against the senior's revision | P1 |
| F-10 | Draft vs. sent email detection (the junior's draft forwarded to the EM, then the EM's sent version) | P0 |

### 7.3 Moment detection
| ID | Requirement | Pri |
|---|---|---|
| F-11 | Classify candidate moments into the taxonomy (§5) with a summary, an excerpt and the people involved | P0 |
| F-12 | Score learning value; only the top N per day become prompts (default N = 3 per senior) | P0 |
| F-13 | Deduplicate against existing approved knowledge ("already explained" → send the junior a Notice card linking the existing item instead of asking the senior again) | P1 |
| F-14 | Detect hedges ("it depends", "usually", "in this case") and flag them as conditional rules | P1 |

### 7.4 Senior prompts (Why cards)
| ID | Requirement | Pri |
|---|---|---|
| F-15 | Delivered as Teams Adaptive Cards in a daily digest at a user-set time | P0 |
| F-16 | Each card: what happened (one line plus excerpt), a suggested rationale, reason tags, Confirm / Edit / Voice / Skip | P0 |
| F-17 | Follow-up probes (max 1): "General rule or specific to this client?", "What would change your mind?" | P1 |
| F-18 | Voice notes transcribed and summarised | P1 |
| F-19 | Hard cap on prompts per day; snooze; quiet hours | P0 |

### 7.5 Junior prompts (Notice cards)
| ID | Requirement | Pri |
|---|---|---|
| F-20 | Spot-the-difference: show the junior's draft beside the final version; the junior lists the changes they notice | P0 |
| F-21 | Predict-then-reveal: the junior writes a prediction and the senior's rationale is then revealed (if captured) | P0 |
| F-22 | Feedback compares the prediction with the rationale (match / partial / missed) and is encouraging, never graded | P0 |
| F-23 | Pattern cards that link recurring moments ("third time this week…") | P1 |
| F-24 | Ask queue with dedup and answers from approved knowledge | P1 |
| F-25 | Private learning journal | P0 |

### 7.6 Knowledge base
| ID | Requirement | Pri |
|---|---|---|
| F-26 | Generate draft Decision, Heuristic and Case items from answered prompts | P0 |
| F-27 | Senior approval workflow; nothing is shared without approval | P0 |
| F-28 | Heuristics structured as *When [context], [do X], because [reason]. Except when [condition].* | P0 |
| F-29 | Provenance: author, Task, date, redacted source excerpt | P0 |
| F-30 | Sharing levels: Task, then Practice, then Firm (Practice and Firm require knowledge-lead curation) | P1 |
| F-31 | Endorse or contest by other seniors | P2 |
| F-32 | Contextual resurfacing when a new Task resembles past ones | P1 |

### 7.7 Pair features
| ID | Requirement | Pri |
|---|---|---|
| F-33 | Weekly debrief agenda (3–5 items) posted in the pair's chat | P1 |

## 8. UX surfaces

| Surface | Used for | Pri |
|---|---|---|
| **Teams app (bot + personal tab)** | Digests, Why and Notice cards, journal, knowledge base, approvals | P0 |
| **Teams message extension** | "Add to Mentor Task", "Ask Mentor" | P0 |
| **Outlook add-in** | Link a thread to a Task; "Send my draft to EM for review" | P1 |
| **Web app** | Same as the personal tab; admin and knowledge-lead curation | P1 |

**UX principles:** answering takes seconds and needs one tap where possible. Mentor's interventions are phrased as questions or hypotheses, never as verdicts. Juniors and seniors see different framings of the same moment. A visible "Mentor is watching this Task" indicator is shown at all times.

## 9. AI design

**Pipeline**
1. **Ingest and redact:** remove client names, personal data and figures where possible. A per-client entity list is maintained.
2. **Segment** the stream into events: message, edit, diff, transcript turn.
3. **Detect:** a fast, low-cost model screens events; a stronger model classifies candidates into the taxonomy and scores learning value.
4. **Draft prompts:** generate a suggested rationale for the senior and spot-the-difference and prediction prompts for the junior. Prompts must be phrased as questions.
5. **Distil:** turn answers into structured Knowledge Items.
6. **Compare:** semantically compare the junior's prediction with the senior's rationale.
7. **Retrieve:** match new Tasks with approved knowledge.

**Model:** Claude (Anthropic) via an EU-hosted endpoint. Prompts are versioned and evaluated against a labelled set of consulting moments.

**Guardrails**
- No inference about personality, competence or performance. The system prompt and output filters block evaluative language about people.
- Suggested rationales are labelled "Mentor's guess" until a person confirms them.
- Confidence thresholds: low-confidence moments are dropped, not sent as prompts.

**Quality targets (pilot):** ≥ 70% of delivered prompts rated "relevant" by recipients; < 5% rated "wrong or inappropriate".

## 10. Non-functional requirements

| Area | Requirement |
|---|---|
| **Privacy & legal** | GDPR: lawful basis documented, DPIA completed, data minimisation, retention of raw excerpts ≤ 90 days, approved knowledge kept until deleted. EU AI Act: positioned and enforced as *not* used for employment evaluation; transparency notices in place. Works council / employee representatives consulted before the pilot. |
| **Confidentiality** | Client-level access walls; knowledge items abstracted from client specifics before Practice/Firm sharing; no training on customer data |
| **Security** | Entra ID SSO; least-privilege Graph permissions scoped to linked resources (resource-specific consent where possible); encryption in transit and at rest; audit log |
| **Data residency** | EU hosting for storage and model inference |
| **Performance** | Post-meeting moments within 30 min of transcript availability; daily digests on time ± 5 min |
| **Accessibility** | WCAG 2.2 AA for tab and web; voice-note alternative to typing |

## 11. Release plan

| Phase | Scope | Exit criteria |
|---|---|---|
| **0. Demo** (this sprint) | Scripted, clickable prototype, no integrations | Compelling 4-minute walkthrough for firm stakeholders |
| **1. Wizard-of-Oz pilot** (4 wks, 3 pairs) | Real Tasks; moments curated by a human operator plus AI; cards delivered via Teams | Seniors answer ≥ 50%; pairs want to continue |
| **2. Pilot MVP** (8 wks, 5–10 pairs) | All P0 requirements; automated detection | Goals G1–G5 met |
| **3. Practice rollout** | P1 requirements, knowledge curation, resurfacing | Adoption across one practice; signal of reduced ramp-up time |

## 12. Demo specification

**Format:** a single web page, scripted, in English. It runs in a browser and needs no backend. A presenter advances through it with a "Next" button or the arrow keys. Total length about 4 minutes.

**Fictional setting:** *Northbridge Partners*, a consultancy. Engagement Manager **Anna Lindqvist** and Business Analyst **Jonas Berg** are preparing the third steering-committee (SteerCo) update for the client *Halvorsen Logistics* (a network-optimisation project). The client's CFO has just joined the SteerCo.

**Layout**
- **Left: work stream.** Outlook, Teams and transcript items appear one at a time, styled like M365.
- **Centre: Mentor.** Detected moments are highlighted with a type label.
- **Right: role view.** A toggle switches between **Anna (EM)** with Why cards and approvals, and **Jonas (Analyst)** with Notice cards and predict-then-reveal.
- **Bottom or drawer: knowledge base.** It fills with approved items as the demo proceeds.

**Scenes**
| # | Beat | What the viewer sees |
|---|---|---|
| 0 | Setup | Anna creates the Mentor Task "SteerCo #3 – Halvorsen" from the Teams chat; Jonas accepts. The consent banner shows what is watched. |
| 1 | Draft vs. sent | Jonas's draft email to the client (it opens with an apology for the delay and buries the request) → Anna's sent version (the request in the first line, no apology, a deadline, the CFO moved from cc to "to"). Mentor highlights 3 changes. |
| 2 | Anna's Why card | "You led with the ask and removed the apology. Mentor's guess: *with a CFO audience, lead with the decision needed; apologising signals weakness on timeline.* Right?" Anna taps **Confirm and edit**, adds: "Also: never apologise for something the client caused." Answer time shown: 12 s. |
| 3 | Jonas's Notice card | "Spot 3 things Anna changed." Jonas finds 2 and misses the cc change. "Why do you think the apology was removed?" Jonas predicts. Reveal: a side-by-side of his prediction and Anna's rationale, with "You spotted the main idea. One thing you missed: who's on 'to' vs 'cc'." |
| 4 | Deck revision | Jonas's slide order (Background → Analysis → Recommendation) next to Anna's (Recommendation → Impact for CFO → Supporting analysis); one sensitivity chart removed. Mentor creates a moment; both cards are shown briefly. |
| 5 | Meeting transcript | In the team prep call Anna says: "Whether we show the downside scenario… it depends who's in the room." Mentor flags a conditional rule and asks Anna: "What decides it?" Anna: "If the CFO is there, show it upfront: they'll find it anyway. If it's only ops, keep it in the appendix." This becomes an if/then heuristic. |
| 6 | Ask queue | Jonas asks Mentor: "Should I send the pre-read 24 or 48 hours before SteerCo?" Mentor answers from an approved heuristic Anna confirmed earlier and cites it. |
| 7 | Knowledge base and debrief | The knowledge base shows 4 approved items with provenance. A Friday debrief agenda with 3 items is posted in the pair's chat. |
| 8 | One month later | New analyst **Sofie** starts a SteerCo deck for another client with a CFO on the SteerCo. Mentor surfaces the 3 relevant heuristics, attributed to Anna. Closing line: *"Anna's judgment, available when it's needed."* |

**Demo requirements**
- D-1: Self-contained HTML/JS; works offline; ≤ 1 file plus assets.
- D-2: Keyboard and button navigation, scene indicator, restart.
- D-3: Visual language close to M365 (Fluent-like) without using Microsoft logos or branding. Mentor has its own distinct brand colour.
- D-4: All names, companies and content are fictional.
- D-5: Readable on a projector (min 16 px body text) and responsive down to a laptop screen.
- D-6: Optional "presenter notes" toggle with talking points per scene.

## 13. Metrics and instrumentation (pilot)

- Prompt funnel: delivered, opened, answered or skipped, time-to-answer
- Notice funnel: delivered, attempted, prediction submitted, reveal viewed
- Prediction–rationale agreement per junior over time (visible **only to that junior**)
- Knowledge: drafted, approved, rejected, resurfaced, viewed
- Relevance ratings per prompt (thumbs up/down plus reason)
- Pre- and post-pilot surveys: perceived learning, time cost, trust (NPS-style)

## 14. Naming

"Mentor" is clear but generic and hard to trademark or search for. Alternatives:

| Name | Rationale |
|---|---|
| **Margin** | The reasoning that lives "in the margin" of the work; short and ownable ("Margin notes from Anna"). *Preferred.* |
| **Overhear** | Brings back the overhearing that hybrid work lost; memorable, slightly provocative (may raise surveillance associations) |
| **Tacit** | Names exactly what it captures; strong with a KM audience |
| **Whetstone** | Sharpening judgment by working against a senior |
| **Understudy** | Learning the role by shadowing; theatrical and warm |
| **Why Notes** | Descriptive; the product is the "why" |

Trademark and domain availability still need to be checked.

## 15. Open questions

1. Should Practice/Firm sharing be in pilot scope, or kept at Task/pair level only?
2. Who operates the Wizard-of-Oz phase: the L&D team or the product team?
3. Should seniors get any recognition signal (e.g. "your heuristics helped 12 analysts") without that becoming evaluation?
4. Should the junior's draft be submitted explicitly through an Outlook "send for review" button (more reliable) or detected automatically (no friction)?
5. Should partners take part as seniors in the pilot, or only EMs?
