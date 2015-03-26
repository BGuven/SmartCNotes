problemsSampleData = [
{
  id:         1,
  name:     "Atrial fibrillation plan",
  dx:     "",
  tx:     "Rate -> 0, Rhythm -> 0, Anticoagulation -> 0",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
},
{
  id:         2,
  name:     "bilateral Air space disease plan",
  dx:     "",
  tx:     "",
  prognosis:  "",
  cause_desc: "",
  sub_problems: [3]
} , 
{
  id:         3,
  name:     "pneumonia",
  dx:     "",
  tx:     "",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
},
{
  id:         4,
  name:     "Delirium",
  dx:     "",
  tx:     "benzo and haldol PRN aim for RASS of 0",
  prognosis:  "",
  cause_desc: "ICU multifactorial",
  sub_problems: []
},
{
  id:         5,
  name:     "Fever NYD",
  dx:     "get cultures, CXR no clear source at this time ",
  tx:     "no antibiotics for now but infectious disease to see",
  prognosis:  "",
  cause_desc: "Infectious cause vs other",
  sub_problems: []
},
{
  id:         6,
  name:     "Hypotension",
  dx:     "",
  tx:     "",
  prognosis:  "",
  cause_desc: "",
  sub_problems: [7,8,9,10]
},
{
  id:         7,
  name:     "hypovolemic",
  dx:     "clinical picture is consistent with volume depletion",
  tx:     "give volume",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
},
{
  id:         8,
  name:     "distributive",
  dx:     "",
  tx:     "Volume and inotropes +/- steroid ",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
},
{
  id:         9,
  name:     "cardiac",
  dx:     "",
  tx:     "",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
},
{
  id:         10,
  name:     "obstructive",
  dx:     "",
  tx:     "",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
},
{
  id:         11,
  name:     "Renal failure plan ",
  dx:     "",
  tx:     "",
  prognosis:  "",
  cause_desc: "",
  sub_problems: [12,13,14]
},
{
  id:         12,
  name:     "prerenal",
  dx:     "follow response to fluids",
  tx:     "fluid challenge and improve blood pressure",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
},
{
  id:         13,
  name:     "intra-renal",
  dx:     "likely ATN secondary to hypotension and sepsis",
  tx:     "supportive and dialysis if indicated",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
},
{
  id:         14,
  name:     "obstruction",
  dx:     "supportive and dialysis if indicated",
  tx:     "not likely but get ultrasound abdomen",
  prognosis:  "",
  cause_desc: "",
  sub_problems: []
}]



problemsSampleData.each do |sampleProblem|
  problem = Problem.create!(
    :name => sampleProblem[:name],
    :dx => sampleProblem[:dx],
    :tx => sampleProblem[:tx],
    :prognosis => sampleProblem[:prognosis],
    :cause_desc => sampleProblem[:cause_desc]
    )

  sampleProblem[:sub_problems].each do |sub_problem_id|
    problem.problem_references.build(:sub_problem_id => sub_problem_id) 
    problem.save
  end 
end