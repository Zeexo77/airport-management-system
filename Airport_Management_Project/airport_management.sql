{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;\f1\fmodern\fcharset0 Courier-Oblique;}
{\colortbl;\red255\green255\blue255;\red195\green123\blue90;\red19\green20\blue21;\red174\green176\blue183;
\red103\green107\blue114;\red185\green101\blue173;\red38\green157\blue169;\red89\green158\blue96;\red72\green151\blue245;
\red254\green187\blue91;}
{\*\expandedcolortbl;;\csgenericrgb\c76471\c48235\c35294;\csgenericrgb\c7451\c7843\c8235;\csgenericrgb\c68235\c69020\c71765;
\csgenericrgb\c40392\c41961\c44706;\csgenericrgb\c72549\c39608\c67843;\csgenericrgb\c14902\c61569\c66275;\csgenericrgb\c34902\c61961\c37647;\csgenericrgb\c28235\c59216\c96078;
\csgenericrgb\c99608\c73333\c35686;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf2 \cb3 DROP DATABASE IF EXISTS \cf4 airport_management;\
\cf2 CREATE DATABASE \cf4 airport_management;\
\cf2 USE \cf4 airport_management;\
\
\cf5 -- 1. AIRPLANE MODEL\
\cf2 CREATE TABLE \cf4 Airplane_Model (\
                                \cf6 model_no \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 PRIMARY KEY\cf4 ,\
                                \cf6 capacity \cf2 INT NOT NULL\cf4 ,\
                                \cf6 weight \cf2 DECIMAL\cf4 (\cf7 10\cf4 ,\cf7 2\cf4 )\
);\
\
\cf5 -- 2. AIRPLANE\
\cf2 CREATE TABLE \cf4 Airplane (\
                          \cf6 plane_no \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 PRIMARY KEY\cf4 ,\
                          \cf6 model_no \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 NOT NULL\cf4 ,\
                          \cf2 FOREIGN KEY \cf4 (\cf6 model_no\cf4 ) \cf2 REFERENCES \cf4 Airplane_Model(\cf6 model_no\cf4 )\
);\
\
\cf5 -- 3. HANGAR\
\cf2 CREATE TABLE \cf4 Hangar (\
                        \cf6 hangar_no \cf2 INT PRIMARY KEY\cf4 ,\
                        \cf6 location \cf2 VARCHAR\cf4 (\cf7 100\cf4 ) \cf2 NOT NULL\cf4 ,\
                        \cf6 capacity \cf2 INT NOT NULL\
\cf4 );\
\
\cf5 -- 4. AIRPLANE LOCATION HISTORY\
\cf2 CREATE TABLE \cf4 Airplane_Location (\
                                   \cf6 location_id \cf2 INT AUTO_INCREMENT PRIMARY KEY\cf4 ,\
                                   \cf6 plane_no \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 NOT NULL\cf4 ,\
                                   \cf6 hangar_no \cf2 INT NOT NULL\cf4 ,\
                                   \cf6 in_date \cf2 DATE NOT NULL\cf4 ,\
                                   \cf6 out_date \cf2 DATE\cf4 ,\
                                   \cf2 FOREIGN KEY \cf4 (\cf6 plane_no\cf4 ) \cf2 REFERENCES \cf4 Airplane(\cf6 plane_no\cf4 ),\
                                   \cf2 FOREIGN KEY \cf4 (\cf6 hangar_no\cf4 ) \cf2 REFERENCES \cf4 Hangar(\cf6 hangar_no\cf4 )\
);\
\
\cf5 -- 5. EMPLOYEE\
\cf2 CREATE TABLE \cf4 Employee (\
                          \cf6 ssn \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 PRIMARY KEY\cf4 ,\
                          \cf6 name \cf2 VARCHAR\cf4 (\cf7 100\cf4 ) \cf2 NOT NULL\cf4 ,\
                          \cf6 phone \cf2 VARCHAR\cf4 (\cf7 20\cf4 ),\
                          \cf6 address \cf2 VARCHAR\cf4 (\cf7 150\cf4 ),\
                          \cf6 salary \cf2 DECIMAL\cf4 (\cf7 10\cf4 ,\cf7 2\cf4 ),\
                          \cf6 union_member_no \cf2 VARCHAR\cf4 (\cf7 30\cf4 ) \cf2 UNIQUE NOT NULL\
\cf4 );\
\
\cf5 -- 6. TECHNICIAN\
\cf2 CREATE TABLE \cf4 Technician (\
                            \cf6 ssn \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 PRIMARY KEY\cf4 ,\
                            \cf2 FOREIGN KEY \cf4 (\cf6 ssn\cf4 ) \cf2 REFERENCES \cf4 Employee(\cf6 ssn\cf4 )\
);\
\
\cf5 -- 7. TRAFFIC CONTROLLER\
\cf2 CREATE TABLE \cf4 Traffic_Controller (\
                                    \cf6 ssn \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 PRIMARY KEY\cf4 ,\
                                    \cf6 most_recent_exam_date \cf2 DATE NOT NULL\cf4 ,\
                                    \cf2 FOREIGN KEY \cf4 (\cf6 ssn\cf4 ) \cf2 REFERENCES \cf4 Employee(\cf6 ssn\cf4 )\
);\
\
\cf5 -- 8. AIRPORT WORKER\
\cf2 CREATE TABLE \cf4 Airport_Worker (\
                                \cf6 ssn \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 PRIMARY KEY\cf4 ,\
                                \cf6 job_title \cf2 VARCHAR\cf4 (\cf7 50\cf4 ),\
                                \cf2 FOREIGN KEY \cf4 (\cf6 ssn\cf4 ) \cf2 REFERENCES \cf4 Employee(\cf6 ssn\cf4 )\
);\
\
\cf5 -- 9. TECHNICIAN EXPERTISE\
\cf2 CREATE TABLE \cf4 Technician_Expertise (\
                                      \cf6 ssn \cf2 VARCHAR\cf4 (\cf7 20\cf4 ),\
                                      \cf6 model_no \cf2 VARCHAR\cf4 (\cf7 20\cf4 ),\
                                      \cf2 PRIMARY KEY \cf4 (\cf6 ssn\cf4 , \cf6 model_no\cf4 ),\
                                      \cf2 FOREIGN KEY \cf4 (\cf6 ssn\cf4 ) \cf2 REFERENCES \cf4 Technician(\cf6 ssn\cf4 ),\
                                      \cf2 FOREIGN KEY \cf4 (\cf6 model_no\cf4 ) \cf2 REFERENCES \cf4 Airplane_Model(\cf6 model_no\cf4 )\
);\
\
\cf5 -- 10. TEST\
\cf2 CREATE TABLE \cf4 Test (\
                      \cf6 test_no \cf2 INT PRIMARY KEY\cf4 ,\
                      \cf6 test_name \cf2 VARCHAR\cf4 (\cf7 100\cf4 ) \cf2 NOT NULL\cf4 ,\
                      \cf6 max_score \cf2 INT NOT NULL\
\cf4 );\
\
\cf5 -- 11. TEST EVENT\
\cf2 CREATE TABLE \cf4 Test_Event (\
                            \cf6 event_id \cf2 INT AUTO_INCREMENT PRIMARY KEY\cf4 ,\
                            \cf6 plane_no \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 NOT NULL\cf4 ,\
                            \cf6 ssn \cf2 VARCHAR\cf4 (\cf7 20\cf4 ) \cf2 NOT NULL\cf4 ,\
                            \cf6 test_no \cf2 INT NOT NULL\cf4 ,\
                            \cf6 test_date \cf2 DATE NOT NULL\cf4 ,\
                            \cf6 hours_spent \cf2 DECIMAL\cf4 (\cf7 5\cf4 ,\cf7 2\cf4 ) \cf2 NOT NULL\cf4 ,\
                            \cf6 score \cf2 INT NOT NULL\cf4 ,\
                            \cf2 FOREIGN KEY \cf4 (\cf6 plane_no\cf4 ) \cf2 REFERENCES \cf4 Airplane(\cf6 plane_no\cf4 ),\
                            \cf2 FOREIGN KEY \cf4 (\cf6 ssn\cf4 ) \cf2 REFERENCES \cf4 Technician(\cf6 ssn\cf4 ),\
                            \cf2 FOREIGN KEY \cf4 (\cf6 test_no\cf4 ) \cf2 REFERENCES \cf4 Test(\cf6 test_no\cf4 )\
);\
\
\cf5 -- INSERT DATA\
\
\cf2 INSERT INTO \cf4 Airplane_Model \cf2 VALUES\
                               \cf4 (\cf8 'B737'\cf4 , \cf7 180\cf4 , \cf7 41400\cf4 ),\
                               (\cf8 'A320'\cf4 , \cf7 170\cf4 , \cf7 42600\cf4 ),\
                               (\cf8 'B777'\cf4 , \cf7 396\cf4 , \cf7 167800\cf4 ),\
                               (\cf8 'A380'\cf4 , \cf7 853\cf4 , \cf7 277000\cf4 );\
\
\cf2 INSERT INTO \cf4 Airplane \cf2 VALUES\
                         \cf4 (\cf8 'P1001'\cf4 , \cf8 'B737'\cf4 ),\
                         (\cf8 'P1002'\cf4 , \cf8 'A320'\cf4 ),\
                         (\cf8 'P1003'\cf4 , \cf8 'B777'\cf4 ),\
                         (\cf8 'P1004'\cf4 , \cf8 'A380'\cf4 ),\
                         (\cf8 'P1005'\cf4 , \cf8 'B737'\cf4 );\
\
\cf2 INSERT INTO \cf4 Hangar \cf2 VALUES\
                       \cf4 (\cf7 1\cf4 , \cf8 'North Area'\cf4 , \cf7 5\cf4 ),\
                       (\cf7 2\cf4 , \cf8 'South Area'\cf4 , \cf7 4\cf4 ),\
                       (\cf7 3\cf4 , \cf8 'East Area'\cf4 , \cf7 6\cf4 );\
\
\cf2 INSERT INTO \cf4 Airplane_Location\
(\cf6 plane_no\cf4 , \cf6 hangar_no\cf4 , \cf6 in_date\cf4 , \cf6 out_date\cf4 ) \cf2 VALUES\
                                             \cf4 (\cf8 'P1001'\cf4 , \cf7 1\cf4 , \cf8 '2026-01-01'\cf4 , \cf8 '2026-02-01'\cf4 ),\
                                             (\cf8 'P1001'\cf4 , \cf7 2\cf4 , \cf8 '2026-02-02'\cf4 , \cf2 NULL\cf4 ),\
                                             (\cf8 'P1002'\cf4 , \cf7 1\cf4 , \cf8 '2026-01-10'\cf4 , \cf2 NULL\cf4 ),\
                                             (\cf8 'P1003'\cf4 , \cf7 3\cf4 , \cf8 '2026-03-01'\cf4 , \cf2 NULL\cf4 ),\
                                             (\cf8 'P1004'\cf4 , \cf7 2\cf4 , \cf8 '2026-02-20'\cf4 , \cf2 NULL\cf4 ),\
                                             (\cf8 'P1005'\cf4 , \cf7 1\cf4 , \cf8 '2026-04-01'\cf4 , \cf2 NULL\cf4 );\
\
\cf2 INSERT INTO \cf4 Employee \cf2 VALUES\
                         \cf4 (\cf8 '111'\cf4 , \cf8 'Ahmed Ali'\cf4 , \cf8 '0551111111'\cf4 , \cf8 'Nicosia'\cf4 , \cf7 2500\cf4 , \cf8 'U001'\cf4 ),\
                         (\cf8 '222'\cf4 , \cf8 'Sara Omar'\cf4 , \cf8 '0552222222'\cf4 , \cf8 'Kyrenia'\cf4 , \cf7 2800\cf4 , \cf8 'U002'\cf4 ),\
                         (\cf8 '333'\cf4 , \cf8 'John Smith'\cf4 , \cf8 '0553333333'\cf4 , \cf8 'Famagusta'\cf4 , \cf7 3000\cf4 , \cf8 'U003'\cf4 ),\
                         (\cf8 '444'\cf4 , \cf8 'Mona Hassan'\cf4 , \cf8 '0554444444'\cf4 , \cf8 'Nicosia'\cf4 , \cf7 2700\cf4 , \cf8 'U004'\cf4 ),\
                         (\cf8 '555'\cf4 , \cf8 'Ali Khan'\cf4 , \cf8 '0555555555'\cf4 , \cf8 'Lefke'\cf4 , \cf7 2400\cf4 , \cf8 'U005'\cf4 ),\
                         (\cf8 '666'\cf4 , \cf8 'David Brown'\cf4 , \cf8 '0556666666'\cf4 , \cf8 'Nicosia'\cf4 , \cf7 2600\cf4 , \cf8 'U006'\cf4 );\
\
\cf2 INSERT INTO \cf4 Technician \cf2 VALUES\
                           \cf4 (\cf8 '111'\cf4 ),\
                           (\cf8 '222'\cf4 ),\
                           (\cf8 '333'\cf4 );\
\
\cf2 INSERT INTO \cf4 Traffic_Controller \cf2 VALUES\
                                   \cf4 (\cf8 '444'\cf4 , \cf8 '2026-04-15'\cf4 ),\
                                   (\cf8 '555'\cf4 , \cf8 '2026-03-20'\cf4 );\
\
\cf2 INSERT INTO \cf4 Airport_Worker \cf2 VALUES\
    \cf4 (\cf8 '666'\cf4 , \cf8 'Cleaner'\cf4 );\
\
\cf2 INSERT INTO \cf4 Technician_Expertise \cf2 VALUES\
                                     \cf4 (\cf8 '111'\cf4 , \cf8 'B737'\cf4 ),\
                                     (\cf8 '111'\cf4 , \cf8 'A320'\cf4 ),\
                                     (\cf8 '222'\cf4 , \cf8 'B777'\cf4 ),\
                                     (\cf8 '333'\cf4 , \cf8 'A380'\cf4 ),\
                                     (\cf8 '333'\cf4 , \cf8 'B737'\cf4 );\
\
\cf2 INSERT INTO \cf4 Test \cf2 VALUES\
                     \cf4 (\cf7 1\cf4 , \cf8 'Engine Test'\cf4 , \cf7 100\cf4 ),\
                     (\cf7 2\cf4 , \cf8 'Landing Gear Test'\cf4 , \cf7 100\cf4 ),\
                     (\cf7 3\cf4 , \cf8 'Fuel System Test'\cf4 , \cf7 100\cf4 ),\
                     (\cf7 4\cf4 , \cf8 'Safety Test'\cf4 , \cf7 100\cf4 );\
\
\cf2 INSERT INTO \cf4 Test_Event\
(\cf6 plane_no\cf4 , \cf6 ssn\cf4 , \cf6 test_no\cf4 , \cf6 test_date\cf4 , \cf6 hours_spent\cf4 , \cf6 score\cf4 ) \cf2 VALUES\
                                                            \cf4 (\cf8 'P1001'\cf4 , \cf8 '111'\cf4 , \cf7 1\cf4 , \cf8 '2026-04-01'\cf4 , \cf7 3.5\cf4 , \cf7 90\cf4 ),\
                                                            (\cf8 'P1001'\cf4 , \cf8 '111'\cf4 , \cf7 2\cf4 , \cf8 '2026-04-05'\cf4 , \cf7 2.0\cf4 , \cf7 85\cf4 ),\
                                                            (\cf8 'P1002'\cf4 , \cf8 '111'\cf4 , \cf7 1\cf4 , \cf8 '2026-04-07'\cf4 , \cf7 4.0\cf4 , \cf7 88\cf4 ),\
                                                            (\cf8 'P1003'\cf4 , \cf8 '222'\cf4 , \cf7 3\cf4 , \cf8 '2026-04-10'\cf4 , \cf7 5.5\cf4 , \cf7 92\cf4 ),\
                                                            (\cf8 'P1004'\cf4 , \cf8 '333'\cf4 , \cf7 4\cf4 , \cf8 '2026-04-12'\cf4 , \cf7 6.0\cf4 , \cf7 95\cf4 ),\
                                                            (\cf8 'P1005'\cf4 , \cf8 '333'\cf4 , \cf7 1\cf4 , \cf8 '2026-04-15'\cf4 , \cf7 3.0\cf4 , \cf7 80\cf4 ),\
                                                            (\cf8 'P1003'\cf4 , \cf8 '222'\cf4 , \cf7 2\cf4 , \cf8 '2026-04-18'\cf4 , \cf7 2.5\cf4 , \cf7 89\cf4 );\
\
\cf5 -- 15 REQUIRED QUERIES\
\
-- 1. Show all airplanes with their models\
\cf2 SELECT \cf4 a.\cf6 plane_no\cf4 , a.\cf6 model_no\cf4 , m.\cf6 capacity\
\cf2 FROM \cf4 Airplane a\
         \cf2 JOIN \cf4 Airplane_Model m \cf2 ON \cf4 a.\cf6 model_no \cf4 = m.\cf6 model_no\cf4 ;\
\
\cf5 -- 2. Show current location of airplanes\
\cf2 SELECT \cf4 a.\cf6 plane_no\cf4 , h.\cf6 hangar_no\cf4 , h.\cf6 location\
\cf2 FROM \cf4 Airplane_Location al\
         \cf2 JOIN \cf4 Airplane a \cf2 ON \cf4 al.\cf6 plane_no \cf4 = a.\cf6 plane_no\
         \cf2 JOIN \cf4 Hangar h \cf2 ON \cf4 al.\cf6 hangar_no \cf4 = h.\cf6 hangar_no\
\cf2 WHERE \cf4 al.\cf6 out_date \cf2 IS NULL\cf4 ;\
\
\cf5 -- 3. Show all technicians\
\cf2 SELECT \cf4 e.\cf6 ssn\cf4 , e.\cf6 name\cf4 , e.\cf6 phone\
\cf2 FROM \cf4 Employee e\
         \cf2 JOIN \cf4 Technician t \cf2 ON \cf4 e.\cf6 ssn \cf4 = t.\cf6 ssn\cf4 ;\
\
\cf5 -- 4. Show technician expertise\
\cf2 SELECT \cf4 e.\cf6 name\cf4 , te.\cf6 model_no\
\cf2 FROM \cf4 Technician_Expertise te\
         \cf2 JOIN \cf4 Employee e \cf2 ON \cf4 te.\cf6 ssn \cf4 = e.\cf6 ssn\cf4 ;\
\
\cf5 -- 5. Show traffic controllers and exam dates\
\cf2 SELECT \cf4 e.\cf6 name\cf4 , tc.\cf6 most_recent_exam_date\
\cf2 FROM \cf4 Traffic_Controller tc\
         \cf2 JOIN \cf4 Employee e \cf2 ON \cf4 tc.\cf6 ssn \cf4 = e.\cf6 ssn\cf4 ;\
\
\cf5 -- 6. Show all test events\
\cf2 SELECT \cf4 te.\cf6 event_id\cf4 , te.\cf6 plane_no\cf4 , e.\cf6 name \cf2 AS \cf4 technician, t.\cf6 test_name\cf4 , te.\cf6 test_date\cf4 , te.\cf6 score\
\cf2 FROM \cf4 Test_Event te\
         \cf2 JOIN \cf4 Employee e \cf2 ON \cf4 te.\cf6 ssn \cf4 = e.\cf6 ssn\
         \cf2 JOIN \cf4 Test t \cf2 ON \cf4 te.\cf6 test_no \cf4 = t.\cf6 test_no\cf4 ;\
\
\cf5 -- 7. Average score for each airplane\
\cf2 SELECT \cf6 plane_no\cf4 , 
\f1\i \cf9 AVG
\f0\i0 \cf4 (\cf6 score\cf4 ) \cf2 AS \cf4 average_score\
\cf2 FROM \cf4 Test_Event\
\cf2 GROUP BY \cf6 plane_no\cf4 ;\
\
\cf5 -- 8. Number of tests done by each technician\
\cf2 SELECT \cf4 e.\cf6 name\cf4 , 
\f1\i \cf9 COUNT
\f0\i0 \cf4 (\cf10 *\cf4 ) \cf2 AS \cf4 total_tests\
\cf2 FROM \cf4 Test_Event te\
         \cf2 JOIN \cf4 Employee e \cf2 ON \cf4 te.\cf6 ssn \cf4 = e.\cf6 ssn\
\cf2 GROUP BY \cf4 e.\cf6 name\cf4 ;\
\
\cf5 -- 9. Airplanes with score greater than 90\
\cf2 SELECT \cf6 plane_no\cf4 , \cf6 score\
\cf2 FROM \cf4 Test_Event\
\cf2 WHERE \cf6 score \cf4 > \cf7 90\cf4 ;\
\
\cf5 -- 10. Total hours spent by each technician\
\cf2 SELECT \cf4 e.\cf6 name\cf4 , 
\f1\i \cf9 SUM
\f0\i0 \cf4 (te.\cf6 hours_spent\cf4 ) \cf2 AS \cf4 total_hours\
\cf2 FROM \cf4 Test_Event te\
         \cf2 JOIN \cf4 Employee e \cf2 ON \cf4 te.\cf6 ssn \cf4 = e.\cf6 ssn\
\cf2 GROUP BY \cf4 e.\cf6 name\cf4 ;\
\
\cf5 -- 11. Highest test score\
\cf2 SELECT 
\f1\i \cf9 MAX
\f0\i0 \cf4 (\cf6 score\cf4 ) \cf2 AS \cf4 highest_score\
\cf2 FROM \cf4 Test_Event;\
\
\cf5 -- 12. Lowest test score\
\cf2 SELECT 
\f1\i \cf9 MIN
\f0\i0 \cf4 (\cf6 score\cf4 ) \cf2 AS \cf4 lowest_score\
\cf2 FROM \cf4 Test_Event;\
\
\cf5 -- 13. Tests performed after 2026-04-10\
\cf2 SELECT \cf10 *\
\cf2 FROM \cf4 Test_Event\
\cf2 WHERE \cf6 test_date \cf4 > \cf8 '2026-04-10'\cf4 ;\
\
\cf5 -- 14. Count airplanes in each hangar currently\
\cf2 SELECT \cf4 h.\cf6 hangar_no\cf4 , h.\cf6 location\cf4 , 
\f1\i \cf9 COUNT
\f0\i0 \cf4 (al.\cf6 plane_no\cf4 ) \cf2 AS \cf4 total_airplanes\
\cf2 FROM \cf4 Hangar h\
         \cf2 LEFT JOIN \cf4 Airplane_Location al\
                   \cf2 ON \cf4 h.\cf6 hangar_no \cf4 = al.\cf6 hangar_no \cf2 AND \cf4 al.\cf6 out_date \cf2 IS NULL\
GROUP BY \cf4 h.\cf6 hangar_no\cf4 , h.\cf6 location\cf4 ;\
\
\cf5 -- 15. Find technicians expert in B737\
\cf2 SELECT \cf4 e.\cf6 name\
\cf2 FROM \cf4 Technician_Expertise te\
         \cf2 JOIN \cf4 Employee e \cf2 ON \cf4 te.\cf6 ssn \cf4 = e.\cf6 ssn\
\cf2 WHERE \cf4 te.\cf6 model_no \cf4 = \cf8 'B737'\cf4 ;\
\
}