# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

frammis_seeds=<<~SQL
insert into frammis values
('A',1,0,1,28),
('B',1,0,2,5),
('C',2,0,6,19),
('D',2,0,20,27),
('E',2,12,3,4),
('F',5,0,7,16),
('G',2,6,17,18),
('H',3,0,21,26),
('I',4,8,8,9),
('J',1,0,10,15),
('K',5,3,22,23),
('L',1,4,24,25),
('M',2,7,11,12),
('N',3,2,13,14);

SQL
ActiveRecord::Base.connection.execute(frammis_seeds)
