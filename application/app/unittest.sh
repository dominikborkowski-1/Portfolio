#!bin/bash
http_response1=$(curl -i portfolioserver:5000/ | tac | tac | head -1 | cut -d " " -f2)
http_response2=$(curl -i portfolioserver:5000/books | tac | tac | head -1 | cut -d " " -f2)
http_response3=$(curl -i portfolioserver:5000/movies | tac | tac | head -1 | cut -d " " -f2)
http_response4=$(curl -i portfolioserver:5000/tvseries | tac | tac | head -1 | cut -d " " -f2)
http_response5=$(curl -i portfolioserver:5000/books/add | tac | tac | head -1 | cut -d " " -f2)
http_response6=$(curl -i portfolioserver:5000/movies/add | tac | tac | head -1 | cut -d " " -f2)
http_response7=$(curl -i portfolioserver:5000/tvseries/add | tac | tac | head -1 | cut -d " " -f2)

if [ $http_response1 != "200" ]; then
    echo "Test 1 Failed"
    x=0
else
    echo "Test 1 Passed"
    x=1 
fi

if [ $http_response2 != "200" ]; then
    echo "Test 2 Failed"
    y=0
else
    echo "Test 2 Passed"
    y=1 
fi

if [ $http_response3 != "200" ]; then
    echo "Test 3 Failed"
    z=0
else
    echo "Test 3 Passed" 
    z=1
fi

if [ $http_response4 != "200" ]; then
    echo "Test 4 Failed"
    w=0
else
    echo "Test 4 Passed" 
    w=1
fi

if [ $http_response5 != "200" ]; then
    echo "Test 5 Failed"
    v=0
else
    echo "Test 5 Passed" 
    v=1
fi

if [ $http_response6 != "200" ]; then
    echo "Test 6 Failed"
    a=0
else
    echo "Test 6 Passed" 
    a=1
fi

if [ $http_response7 != "200" ]; then
    echo "Test 7 Failed"
    b=0
else
    echo "Test 7 Passed" 
    b=1
fi
testpassed=$(($x+$y+$z+$w+$v+$a+$b))
alltests=7

echo "Passed ${testpassed} out of ${alltests} tests"