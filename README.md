# Software-Project-Management-Database
Develop and deliver a normalised relational database that is in third normal form(3NF) and can be used to store the following information

1. Clients: organisation name, contact first and last name, email and address, as 
well as the preferred method of contact (by post or via email).
2.  Pool members: first and last name, contact email and phone number, work 
and home address.
3. For pool members' skills: skill name and type, e.g.: 
name="Java", type="Backend" or name=“JUnit”, type=“Testing”
4. Projects: title, start date, end date, budget, a short description and the phase. 
Suggested values for the phase are: "design", "development", "testing", 
"deployment" and "complete".

Database Schema(DDL/Data Definition Language)
Requirements list R1:
1. Clients can offer as many projects as they want. 
2. Pool members can only be assigned to one project if they meet the skill 
requirements. 
3. Pool members may share skills but the level of experience may differ. For instance,
Jenny may be an expert in developing backend software in JavaScript, whereas 
John may be a junior JavaScript developer for frontend applications.
4. There may be projects not linked to any pool members and vice versa. These will 
be projects (and pool members) for which the allocation decisions are pending.

Data Manipulation Language(DML)
Requirements list R2:
 1. Populate the database with a pre-defined list of at least SIX skills.
 2. Create TWO pool members, each associated with at least TWO skills from the pre
defined list. Dummy data should demonstrate a variety of levels of experience.
 3. Populate the database with TWO client records.
 4. Create ONE project that requires TWO of the pre-defined skills to complete.
 5. Query the database to receive a list of pool members that match the project’s 
requirements, and assign them to the project.
 6. Demonstrate design’s strengths by including additional SELECT statements to
 generate different reports for the project management team.
