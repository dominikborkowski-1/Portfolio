#!bin/bash
curl -s -X POST -F 'booktitle=test' -F 'author=test' -F 'bookstartdate=test' -F 'bookfinishdate=test' -F 'bookrating=test' -F 'bookdescription=test' portfolioserver:5000/books/add >/dev/null
http_response=$(curl portfolioserver:5000/books)
test_string="test test test test test test"

if echo "${http_response}" | grep -q "${test_string}"; then
    echo "Adding book Passed"
else
    echo "Adding book Failed"
fi

curl -s -X POST portfolioserver:5000/books/delete/all >/dev/null
http_response2=$(curl portfolioserver:5000/books)

if echo "${http_response2}" | grep -q "${test_string}"; then
    echo "Deleting book Failed"
else
    echo "Deleting book Passed"
fi

curl -s -X POST -F 'movietitle=test' -F 'moviedirector=test' -F 'watchdate=test' -F 'movieactor=test' -F 'movierating=test' -F 'moviedescription=test' portfolioserver:5000/movies/add >/dev/null
http_response3=$(curl portfolioserver:5000/movies)

if echo "${http_response3}" | grep -q "${test_string}"; then
    echo "Adding movie Passed"
else
    echo "Adding movie Failed"
fi

curl -s -X POST portfolioserver:5000/movies/delete/all >/dev/null
http_response4=$(curl portfolioserver:5000/movies)

if echo "${http_response4}" | grep -q "${test_string}"; then
    echo "Deleting movie Failed"
else
    echo "Deleting movie Passed"
fi

curl -s -X POST -F 'tvtitle=test' -F 'tvdirector=test' -F 'tvstartdate=test' -F 'tvfinishdate=test' -F 'tvactor=test' -F 'tvrating=test' -F 'tvdescription=test' portfolioserver:5000/tvseries/add >/dev/null
http_response5=$(curl portfolioserver:5000/tvseries)
test_string2="test test test test test test test"

if echo "${http_response5}" | grep -q "${test_string2}"; then
    echo "Adding tvseries Passed"
else
    echo "Adding tvseries Failed"
fi

curl -s -X POST portfolioserver:5000/tvseries/delete/all >/dev/null
http_response6=$(curl portfolioserver:5000/tvseries)

if echo "${http_response6}" | grep -q "${test_string2}"; then
    echo "Deleting tvseries Failed"
else
    echo "Deleting tvseries Passed"
fi