# 🎯 Dhwani RIS — Daily RFP Scout (mLead)

> **Automatically scrapes DevNetJobsIndia & Devex every morning, scores RFPs for Dhwani's relevance, and drafts full proposals as Word documents.**

---

## What it does

| Step | Action |
|------|--------|
| 1 | Scrapes all RFPs from [DevNetJobsIndia](https://www.devnetjobsindia.org/rfp_assignments.aspx) |
| 2 | Scores each RFP 0–10 for fit with Dhwani's products & services |
| 3 | Filters out irrelevant ones (housekeeping, travel, audits, etc.) |
| 4 | Drafts full Word proposals for top-scoring RFPs |
| 5 | Saves an HTML digest + JSON log to a daily output folder |
| 6 | (Optional) Emails the digest + proposals to your team |

---

## Quick Start

### 1. Install dependencies
```bash
pip install -r requirements.txt
```

### 2. Configure
Edit `config.yaml`:
```yaml
anthropic_api_key: "YOUR_KEY"   # Optional — enables AI scoring & proposal drafting
email:
  enabled: true
  sender_email: "you@company.com"
  password: "your-app-password"
  recipients: ["sales@dhwaniris.com"]
```

> **Without an Anthropic API key:** keyword-based scoring still works — no proposals are drafted automatically, but the digest is generated.

> **Email via Outlook:** Use `smtp_host: smtp.office365.com` and `smtp_port: 587`

### 3. Run
```bash
# Full run
python rfp_agent.py

# Test mode (first 3 RFPs only)
python rfp_agent.py --test

# Skip email
python rfp_agent.py --no-email

# Skip proposal drafting
python rfp_agent.py --no-proposals
```

---

## Output

Each daily run creates a folder: `rfp_output/YYYY-MM-DD/`

| File | Contents |
|------|----------|
| `rfp_digest_YYYY-MM-DD.html` | Full scored digest (open in browser) |
| `rfp_run_log.json` | Structured JSON log of all RFPs |
| `*_Proposal_Dhwani.docx` | Drafted proposals for top RFPs |

---

## Scoring Logic

| Score | Recommendation | Examples |
|-------|---------------|---------|
| 8–10 | ✅ APPLY | Grant management system, MIS platform, data collection app, IVRS |
| 5–7 | 🤔 CONSIDER | Tech-adjacent RFPs, consulting roles with digital component |
| 0–4 | ⏭ SKIP | Housekeeping, travel, CA audits, film production |

**With Anthropic API key:** Claude scores each RFP intelligently using Dhwani's full company profile.  
**Without:** Fast keyword matching against Dhwani's product/service vocabulary.

---

## Scheduling (Daily Automation)

The agent runs automatically every weekday + Saturday at 8 AM via the Cowork scheduled task **mLead**. To run manually anytime, just open Cowork and trigger the task.

---

## Files

| File | Purpose |
|------|---------|
| `rfp_agent.py` | Main agent script |
| `config.yaml` | Configuration (API keys, email, thresholds) |
| `requirements.txt` | Python dependencies |
| `setup_and_run.sh` | One-time setup script |

---

## About Dhwani RIS

**Dhwani Rural Information Systems Pvt Ltd** — ISO 27001:2013 certified tech company serving the social sector.  
📧 reachus@dhwaniris.com | 🌐 www.dhwaniris.in | 📍 Gurgaon, Haryana

<!-- workflow cache refresh -->
