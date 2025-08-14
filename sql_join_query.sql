CREATE TABLE operating_system (
    os_id INT PRIMARY KEY,
    os_name VARCHAR(50),
    latest_update_version VARCHAR(50)
);

INSERT INTO operating_system (os_id, os_name, latest_update_version) VALUES
(1, 'macOS', 'Ventura 13.0'),
(2, 'Windows', '21H2'),
(3, 'Linux', 'Ubuntu 22.04 LTS');



CREATE TABLE software (
    software_id INT PRIMARY KEY,
    software_name VARCHAR(100),
    category VARCHAR(50),
    os_id INT,
    FOREIGN KEY (os_id) REFERENCES operating_system(os_id)
);

INSERT INTO software (software_id, software_name, category, os_id) VALUES
(1, 'Xcode', 'Development', 1),
(2, 'Final Cut Pro', 'Video Editing', 1),
(3, 'Microsoft Office', 'Productivity', 2),
(4, 'GIMP', 'Design', 3);


CREATE TABLE computer (
    computer_id INT PRIMARY KEY,
    computer_name VARCHAR(100),
    manufacturer VARCHAR(50),
    software_id INT,
    FOREIGN KEY (software_id) REFERENCES software(software_id)
);

INSERT INTO computer (computer_id, computer_name, manufacturer, software_id) VALUES
(1, 'MacBook Air M2', 'MAC-M2-001', 1),
(2, 'MacBook M1', 'MAC-M1-002', 1),
(3, 'MacBook M2', 'MAC-M2-003', 1),
(4, 'MacBook M2', 'MAC-M2-004', 1),
(5, 'Dell XPS 13', 'DEL-XPS-004', 2),
(6, 'Lenovo Legion 5', 'LEN-LEG-006', 3),
(7, 'HP Spectre x360', 'HP-SPEC-007', NULL),
(8, 'ASUS ZenBook', 'ASUS-ZEN-008', NULL);



SELECT *
FROM computer
LEFT JOIN software
ON computer.software_id = software.software_id;

SELECT 
    computer.computer_id, 
    computer.computer_name, 
    computer.manufacturer, 
    computer.software_id, 
    software.software_name
FROM computer
LEFT JOIN software
ON computer.software_id = software.software_id;

SELECT *
FROM computer
LEFT JOIN software
ON computer.software_id = software.software_id
LEFT JOIN operating_system
ON software.os_id = operating_system.os_id;
