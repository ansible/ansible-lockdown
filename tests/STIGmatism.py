import untangle
import sys

def percentage(part, whole):
  return 100 * float(part)/float(whole)

result_meta = untangle.parse('./results.xml')
overall_pass_pct = 50
high_pass_pct = 50
med_pass_pct = 50
low_pass_pct = 50

metrics = {
    'high_pass'  : 0,
    'high_fail'  : 0,
    'high_total' : 0,
    'med_pass'   : 0,
    'med_fail'   : 0,
    'med_total'  : 0,
    'low_pass'   : 0,
    'low_fail'   : 0,
    'low_total'  : 0,
    'total_pass' : 0,
    'total_fail' : 0,
}
success_meta = {}

profile = 'MAC-1_Public'
rule_list = [rule.Rule['id'] for rule in result_meta.Benchmark.Group]
pass_fail_list = [res.result.cdata for res in result_meta.Benchmark.TestResult.rule_result]
title_list = [ttl.Rule.title.cdata for ttl in result_meta.Benchmark.Group]
description_list = [desc.Rule.description.cdata for desc in result_meta.Benchmark.Group]
severity_list =  [sev.Rule['severity'] for sev in result_meta.Benchmark.Group]
fix_list = [fix.Rule.fixtext.cdata for fix in result_meta.Benchmark.Group]

total = len(rule_list)

for rule_id, success, severity in zip(rule_list, pass_fail_list, severity_list):
	success_meta.update({ rule_id : {'result': success, 'severity': severity} })

for rule, meta in success_meta.items():
	if meta['severity'] == 'low':
		metrics['low_total'] += 1
		if meta['result'] == 'fail':
			metrics['low_fail'] += 1
		else:
			metrics['low_pass'] += 1

	elif meta['severity'] == 'medium':
		metrics['med_total'] += 1
		if meta['result'] == 'fail':
			metrics['med_fail'] += 1
		else:
			metrics['med_pass'] += 1

	elif meta['severity'] == 'high':
		metrics['high_total'] += 1
		if meta['result'] == 'fail':
			metrics['high_fail'] += 1
		else:
			metrics['high_pass'] += 1

	if meta['result'] == 'fail':
		metrics['total_fail'] += 1
	else:
		metrics['total_pass'] += 1

print metrics



