clear all
close all

a = load('A-BOM.csv');
b = load('B-FDG.csv');
c = load('C-FXM.csv');
d = load('D-IMDB.csv');
e = load('E-MC.csv');
f = load('F-ROT.csv');

ml= load('ML.csv');
mt= load('MT.csv');

rlist= load('ranklist.csv');
completelist={};
for sch = 1:1:3
    completelist{sch} = generatecompletelist(sch,a,b,c,d,e,f,ml,rlist);
end
results={};
counter = 1;
for samples = 5:5:50
    accuracy15 = 0;
    accuracy25 = 0;
    accuracy35 = 0;
    accuracy45 = 0;
    accuracy16 = 0;
    accuracy26 = 0;
    accuracy36 = 0;
    accuracy46 = 0;
    for iterations = 1:1:10000
        indices = getrandomindices(completelist(1),samples);
        testsamplerank1 = getitemrank(completelist(1),indices);
        testsamplerank2 = getitemrank(completelist(2),indices);
        testsamplerank3 = getitemrank(completelist(3),indices);
        testsamplerank5 = getitemrank({ml(:,2)},indices);
        testsamplerank6 = getitemrank({mt(:,2)},indices);
        testsamplerank4 = getrandomrank(indices);
        accuracy15 = accuracy15 + measureaccuracy(testsamplerank1,testsamplerank5);
        accuracy25 = accuracy25 + measureaccuracy(testsamplerank2,testsamplerank5);
        accuracy35 = accuracy35 + measureaccuracy(testsamplerank3,testsamplerank5);
        accuracy45 = accuracy45 + measureaccuracy(testsamplerank4,testsamplerank5);
        accuracy16 = accuracy16 + measureaccuracy(testsamplerank1,testsamplerank6);
        accuracy26 = accuracy26 + measureaccuracy(testsamplerank2,testsamplerank6);
        accuracy36 = accuracy36 + measureaccuracy(testsamplerank3,testsamplerank6);
        accuracy46 = accuracy46 + measureaccuracy(testsamplerank4,testsamplerank6);
    end
    accuracy15 = accuracy15 / 10000;
    accuracy25 = accuracy25 / 10000;
    accuracy35 = accuracy35 / 10000;
    accuracy45 = accuracy45 / 10000;
    accuracy16 = accuracy16 / 10000;
    accuracy26 = accuracy26 / 10000;
    accuracy36 = accuracy36 / 10000;
    accuracy46 = accuracy46 / 10000;
    results{counter,1}=accuracy15;
    results{counter,2}=accuracy25;
    results{counter,3}=accuracy35;
    results{counter,4}=accuracy45;
    results{counter,5}=accuracy16;
    results{counter,6}=accuracy26;
    results{counter,7}=accuracy36;
    results{counter,8}=accuracy46;
    counter = counter +1;
end