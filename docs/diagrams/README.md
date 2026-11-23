# PromptShield design diagrams

These original diagrams satisfy the Milestone 2 design-diagram items. They reflect the current HTML/CSS/JavaScript client, Node.js local API, Vercel API adapter, provider integrations, one-at-a-time test workflow, explicit evaluation action, and client-side PDF report export.

## 1. Prompt workflow

Each challenge can be inspected and run individually. Evaluation begins only after the user clicks **Evaluate responses**.

```mermaid
flowchart LR
    A[Enter chatbot rules] --> B[Choose provider, model, and difficulty]
    B --> C[Generate synthetic challenge suite]
    C --> D{How to get a reply?}
    D -->|Run with AI| E[Send one challenge and rules]
    D -->|Manual review| F[Paste chatbot reply]
    E --> G[Record reply for that test]
    F --> G
    G --> H[User clicks Evaluate responses]
    H --> I[Judge full reply against rules and expected behavior]
    I --> J[Show per-test findings and run summary]
    J --> K[Review results and export PDF]
    J --> L[Human review of ambiguous findings]
```

## 2. Task decomposition

```mermaid
flowchart TD
    P[PromptShield safety check]
    P --> A[Configure test]
    A --> A1[Enter chatbot rules]
    A --> A2[Choose provider, model, and difficulty]
    P --> B[Build challenge suite]
    B --> B1[Select safety categories]
    B --> B2[Generate stage-specific synthetic prompts]
    B --> B3[Define expected safe behavior]
    P --> C[Capture chatbot reply]
    C --> C1[Run one challenge with selected AI model]
    C --> C2[Or paste a reply from an authorized chatbot]
    P --> D[Evaluate answered checks]
    D --> D1[Compare the whole reply with the supplied rules]
    D --> D2[Record verdict, evidence, confidence, and guidance]
    P --> E[Report and review]
    E --> E1[Summarize test results]
    E --> E2[Export PDF]
    E --> E3[Review uncertain findings and retest]
```

## 3. Input-output flow

```mermaid
flowchart LR
    subgraph Inputs
        A[Chatbot rules]
        B[Provider and model]
        C[Difficulty stage]
        D[Synthetic challenge]
        E[Chatbot reply: AI-run or manual]
    end
    subgraph Processing
        F[PromptShield prepares and tracks each test]
        G[Selected provider returns a reply when Run with AI is used]
        H[On explicit evaluation, judge compares rules, challenge, expected behavior, and full reply]
    end
    subgraph Outputs
        I[Per-test verdict and score]
        J[Evidence, confidence, analysis, recommendation]
        K[Run summary and downloadable PDF]
    end
    A --> F
    B --> F
    C --> F
    F --> D
    D --> G
    G --> E
    E --> H
    A --> H
    D --> H
    H --> I
    H --> J
    I --> K
    J --> K
```

Manual replies can be evaluated without sending a challenge to a provider. AI-run challenges and AI-judged evaluations send the relevant rules and test content to the selected provider; API keys remain on the server.

## 4. System architecture

```mermaid
flowchart LR
    subgraph Browser["Browser: HTML, CSS, and JavaScript"]
        UI[Landing page and Safety Lab]
        Suite[Challenge templates and response fields]
        Results[Result cards and run summary]
        PDF[Client-side PDF export]
        UI --> Suite --> Results --> PDF
    end
    subgraph Server["Server/API layer"]
        Local[Local Node server: server.js]
        Vercel["Vercel function: catch-all API route"]
        Env[Protected environment keys]
        Local --> Env
        Vercel --> Env
    end
    subgraph Providers["Hosted provider APIs"]
        NVIDIA[NVIDIA NIM]
        Groq[Groq]
    end
    Suite -->|Run one challenge or evaluate answered checks| Local
    Suite -->|Deployed API request| Vercel
    Env --> NVIDIA
    Env --> Groq
    NVIDIA -->|Reply or rubric judgment| Results
    Groq -->|Reply or rubric judgment| Results
```

The app tests the selected provider model. It does not connect to an independently hosted chatbot, and it does not use an autonomous agent loop or RAG pipeline.

## SVG previews

- [Prompt workflow](prompt-workflow.svg)
- [Task decomposition](task-decomposition.svg)
- [Input-output flow](input-output-flow.svg)
- [System architecture](system-architecture.svg)
