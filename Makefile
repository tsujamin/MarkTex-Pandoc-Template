default: 
	@echo "targets:"
	@echo "report:				compile report.md to pdf via latex"
	@echo "presentation: 			compile presentation.md to pdf via beamer"
	@echo "{report/presentation}_words: 	count the number of words in the respective document"
	@echo "open_{report/presentation}:	open the respective document using the system pdf handler"

report:
	pandoc -S  --template=report.template.tex report.md -o report.pdf

presentation: 
	pandoc -t beamer --template=./presentation.template.tex --variable fontsize=10pt -V theme=Warsaw  presentation.md  -o presentation.pdf

report_words:
	@echo Word count of report: 
	@wc -w report.md 

presentation_words:
	@echo Word count of presentation:
	@wc -w presentation.md

open_report: report
	open ./report.pdf

open_presentation: presentation
	open ./presentation.pdf	
