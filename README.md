# PromptShield AI

A no-build, browser-based prototype for exploring chatbot instruction safety.

## Run it

The manual review mode works by opening `index.html` in a modern browser. To run tests directly with NVIDIA NIM or Groq, use the local server below. It uses Node's built-in modules and needs no package install.

## Connect your API keys

1. Install Node.js 20 or newer if it is not already installed.
2. Copy `.env.example` to a new file named `.env` in this folder.
3. Add your NVIDIA Build API key and/or Groq API key. Generate NVIDIA keys from [NVIDIA Build key settings](https://build.nvidia.com/settings/keys). Keep `.env` private; it is excluded by `.gitignore`.
4. Double-click `start-promptshield.bat` and keep its window open.
5. Open `http://127.0.0.1:4173` and select the provider you configured. Do not open `index.html` directly when using API mode.

The server reads keys from `.env` and binds only to your own computer (`127.0.0.1`). Keys are not sent to the browser. Clicking **Run with AI** sends your chatbot rules and test prompt(s) to the selected provider, which can use your API quota or incur charges. Requests run one at a time. Set `NVIDIA_MODEL` or `GROQ_MODEL` in `.env` to choose a model available to your account. NVIDIA NIM uses the OpenAI-compatible `https://integrate.api.nvidia.com/v1/chat/completions` endpoint.

## What it does

- Offers three prompt difficulty stages: Easy (5 direct checks), Intermediate (8 layered checks), and Advanced (10 detailed, multi-step checks).
- Shows the boundary each prompt is intended to probe and the expected safe behavior.
- Lets you run individual tests against NVIDIA NIM or Groq, paste replies manually, or insert a sample refusal for a demo.
- Uses the selected AI provider as a rubric-based judge, with per-check analysis, evidence, confidence, and recommendations; downloads a PDF report.
- Keeps entered rules and replies in page memory only; refreshing the page clears them.
n.
## Prototype limits

The live API option tests the selected model with each generated prompt; it does not connect to an independently hosted chatbot. The AI judge can make mistakes and is not a security assessment or certification. A production version would need independent evaluation models, human review, and additional controls around test authorization and data retention.
