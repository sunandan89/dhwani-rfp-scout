#!/usr/bin/env python3
"""
scripts/rfp_summary.py
Used by the GitHub Actions workflow to write the job summary table.
Called as: python3 scripts/rfp_summary.py <path_to_rfp_run_log.json>
"""
import json, sys

log_path = sys.argv[1] if len(sys.argv) > 1 else ''
try:
    with open(log_path) as f:
        data = json.load(f)
    for r in data.get('rfps', []):
        if r.get('recommendation') in ('apply', 'consider'):
            score    = r.get('score', 0)
            rec_icon = '\u2705' if r['recommendation'] == 'apply' else '\U0001f914'
            title    = r.get('title', '')[:55]
            org      = r.get('organization', '')[:40]
            deadline = r.get('deadline', 'N/A')
            url      = r.get('url', '#')
            print(f"| {score}/10 | {rec_icon} {r['recommendation'].upper()} | [{title}]({url}) | {org} | {deadline} |")
except Exception as e:
    print(f"<!-- summary error: {e} -->")
