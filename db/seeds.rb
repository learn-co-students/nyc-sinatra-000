landmark = Landmark.create(name: "White House", year_completed: '1792')
title = Title.find_or_create_by(name: "President")
figure = Figure.find_or_create_by(name: "George Washington")

figure.titles << title
landmark.figure = figure
    
landmark.save

landmark2 = Landmark.create(name: "Eiffel Tower", year_completed: '1889')
title2 = Title.find_or_create_by(name: "Engineer")
figure2 = Figure.find_or_create_by(name: "Alexandre Gustave Eiffel")

figure2.titles << title2
landmark2.figure = figure2
    
landmark2.save