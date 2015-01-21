@knowledge_center
Feature: Documents
  As a b2b user
  I should be able to view the document page
  So that I can able to upload document,edit document and share document


  Scenario Outline:Learner uploads document
    When the user should be able to upload file "pdf_UploadDoc" from "<doc_URL>"
  Examples:
    | doc_URL  |
    |Documents/cucumber_cheez.pdf|
