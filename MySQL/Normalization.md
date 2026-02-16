Student\_Grade\_Report 

(Student\_Name,Student\_Phone, Student\_Address, Course\_Title, Instructor\_Name, Instructor\_Dept, Dept\_Building, Grade)



**==================================================**



**Step 1 (1NF): Remove multivalued attributes (Student\_Phone)**



Student\_Grade\_Report

(Student\_Name, Student\_Address, Course\_Title, Instructor\_Name, Instructor\_Dept, Dept\_Building, Grade)



Student\_Phone 

(Student\_Name,Student\_Phone)



**==================================================**



**Step 2 (2NF): Remove partial dependencies (Student\_Address)**



Student\_Grade\_Report

(Student\_Name, Course\_Title, Instructor\_Name, Instructor\_Dept, Dept\_Building, Grade)



Student\_Phone

(Student\_Name,Student\_Phone)



Student\_address

(Student\_Name, City, Street, Zip)



**==================================================**



**Step 3 (3NF): Remove transitive dependencies (Dept\_Building)**



Student\_Grade\_Report

(Student\_Name, Course\_Title, Instructor\_Name, Instructor\_Dept, Grade)



Student\_Phone

(Student\_Name,Student\_Phone)



Student\_address

(Student\_Name, City, Street, Zip)



Dept\_Building

(Instructor\_Dept, Dept\_Building)



