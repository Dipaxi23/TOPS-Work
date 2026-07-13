cr_no=1092038239834
crime_type="Murder"
evidence_items=8
fingerprints=True
dna=False
officer_present=True
visit_time=4.5

print("Case Register No.:", cr_no)
print("Type of Crime:", crime_type)
print("No. of evidences collected:", evidence_items)
if fingerprints:
    print("Fingerprints were found at the scene of crime.")
if visit_time>4:
    print("Investigation took a long time.")
