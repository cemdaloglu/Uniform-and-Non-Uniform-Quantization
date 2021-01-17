close all;
clear all;
rand('seed', sum(100*clock));

% part 1.3

for k = 1:1:1000000
    y_array(k) = -16*(-1+sqrt(1-rand()));
end

figure;
histogram(y_array);
title('Source Samples Histogram');
y_arr_2 = y_array.^2;
ex_sqr_y = mean(y_arr_2);

for k = 1:1:16
quant_level(k) = k;
decision_level(k) = 1/2 + (k-1);
end

for k = 1:1:1000000
    if y_array(k) < quant_level(1)
        r(k) = decision_level(1);
    elseif y_array(k) < quant_level(2) && y_array(k) >= quant_level(1)
        r(k) = decision_level(2);
    elseif y_array(k) < quant_level(3) && y_array(k) >= quant_level(2)
        r(k) = decision_level(3);
    elseif y_array(k) < quant_level(4) && y_array(k) >= quant_level(3)
        r(k) = decision_level(4);
    elseif y_array(k) < quant_level(5) && y_array(k) >= quant_level(4)
        r(k) = decision_level(5);
    elseif y_array(k) < quant_level(6) && y_array(k) >= quant_level(5)
        r(k) = decision_level(6);
    elseif y_array(k) < quant_level(7) && y_array(k) >= quant_level(6)
        r(k) = decision_level(7);
    elseif y_array(k) < quant_level(8) && y_array(k) >= quant_level(7)
        r(k) = decision_level(8);
    elseif y_array(k) < quant_level(9) && y_array(k) >= quant_level(8)
        r(k) = decision_level(9);
    elseif y_array(k) < quant_level(10) && y_array(k) >= quant_level(9)
        r(k) = decision_level(10);
    elseif y_array(k) < quant_level(11) && y_array(k) >= quant_level(10)
        r(k) = decision_level(11);
    elseif y_array(k) < quant_level(12) && y_array(k) >= quant_level(11)
        r(k) = decision_level(12);
    elseif y_array(k) < quant_level(13) && y_array(k) >= quant_level(12)
        r(k) = decision_level(13);
    elseif y_array(k) < quant_level(14) && y_array(k) >= quant_level(13)
        r(k) = decision_level(14);
    elseif y_array(k) < quant_level(15) && y_array(k) >= quant_level(14)
        r(k) = decision_level(15);
    elseif y_array(k) >= quant_level(15)
        r(k) = decision_level(16);
    end
end

% figure;
% histogram(r);


for k = 1:1:1000000
    err(k) = y_array(k)-r(k);
end
y_err_2 = err.^2;
ex_err = mean(y_err_2);
figure;
histogram(err);
title('Histogram of Uniform Quantization Errors');

sqnr = ex_sqr_y./ex_err;
sqnr_dB = 10*log10(sqnr);

[a,y_q1] = lloyd_max();

for k = 1:1:1000000
    if y_array(k) < a(2)
        lloyd_max_array(k) = y_q1(1);
    elseif y_array(k) < a(3) && y_array(k) >= a(2)
        lloyd_max_array(k) = y_q1(2);
    elseif y_array(k) < a(4) && y_array(k) >= a(3)
        lloyd_max_array(k) = y_q1(3);
    elseif y_array(k) < a(5) && y_array(k) >= a(4)
        lloyd_max_array(k) = y_q1(4);
    elseif y_array(k) < a(6) && y_array(k) >= a(5)
        lloyd_max_array(k) = y_q1(5);
    elseif y_array(k) < a(7) && y_array(k) >= a(6)
        lloyd_max_array(k) = y_q1(6);
    elseif y_array(k) < a(8) && y_array(k) >= a(7)
        lloyd_max_array(k) = y_q1(7);
    elseif y_array(k) < a(9) && y_array(k) >= a(8)
        lloyd_max_array(k) = y_q1(8);
    elseif y_array(k) < a(10) && y_array(k) >= a(9)
        lloyd_max_array(k) = y_q1(9);
    elseif y_array(k) < a(11) && y_array(k) >= a(10)
        lloyd_max_array(k) = y_q1(10);
    elseif y_array(k) < a(12) && y_array(k) >= a(11)
        lloyd_max_array(k) = y_q1(11);
    elseif y_array(k) < a(13) && y_array(k) >= a(12)
        lloyd_max_array(k) = y_q1(12);
    elseif y_array(k) < a(14) && y_array(k) >= a(13)
        lloyd_max_array(k) = y_q1(13);
    elseif y_array(k) < a(15) && y_array(k) >= a(14)
        lloyd_max_array(k) = y_q1(14);
    elseif y_array(k) < a(16) && y_array(k) >= a(15)
        lloyd_max_array(k) = y_q1(15);
    elseif y_array(k) >= a(16)
        lloyd_max_array(k) = y_q1(16);
    end
end

for k = 1:1:1000000
    err_lloyd(k) = y_array(k)-lloyd_max_array(k);
end

y_err_lloyd = err_lloyd.^2;
ex_err_lloyd = mean(y_err_lloyd);

sqnr_lloyd = ex_sqr_y./ex_err_lloyd;
sqnr_dB_lloyd = 10*log10(sqnr_lloyd);

% figure;
% histogram(lloyd_max_array);

figure;
histogram(err_lloyd);
title('Histogram of Non-Uniform Quantization Errors');

% part 2

str = "TODAY IS THE LONGEST DAY OF THE SPRING SEMESTER IN BILKENT";
x = repmat(str,[1 1100]);
str_to_char = char(x);
size_of_str(1:3) = size(str_to_char);
char_x = unique(char(str));
char_trace = char(x);
length_char = length(char_x);
length_string = length(char_trace);
length_x = length(x);
count_array = zeros(1,length_char);
pmf = zeros(1, length_char);

for k = 1:1:length_char
    for m = 1:1:length_string
        if char_x(k) == char_trace(m)
            count_array(k) = count_array(k)+1;
        end
    end
end
count_array = count_array*length_x;
for k = 1:1:length_char
    pmf(k) = count_array(k)/(length_string*length_x);
end
figure;
stem(pmf);
title('Pmf of possible characters in given input');
xticks(1:length_char);
str1 = [char_x(:)];
xticklabels(str1);

% Huffman-coding

s = "";

for i=1:length(char_x)
    s(i) = convertCharsToStrings(char_x(i));
end

p = pmf;
i = 1;

for m = 1:length(p)
    for n = 1:length(p)
        if p(m) > p(n)
            a = p(n);
            a1 = s(n);
            p(n) = p(m);
            s(n) = s(m);
            p(m) = a;
            s(m) = a1;
        end
    end
end

s1 = char(s);
totalstr = [""];
w = length(p);
length_p = [w];
str_tree(i,:) = s;
prob_tree(i,:) = p;

while length(p) > 2
    probsum = p(length(p)) + p(length(p)-1);
    strsum = [s(length(s)-1) + s(length(s))];
    totalstr = [totalstr,strsum];
    p = [p(1:length(p)-2)];
    s = [s(1:length(s)-2)];
    flag = 0;
    k = 1;
    while flag == 0
        if probsum <= p(k) && probsum >= p(k+1)
            p = [p(1:(k)), probsum, p(k+1:length(p))];
            s = [s(1:(k)), strsum, s(k+1:length(s))];
            w1 = k;
            flag = 1;
        elseif probsum > p(1)
            p = [probsum, p(1:length(p))];
            s = [strsum, s(1:length(s))];
            w1 = 1;
            flag = 1;
        elseif probsum < p(length(p))
            p = [p(1:length(p)),probsum];
            s = [s(1:length(s)),strsum];
            w1 = length(p);
            flag = 1;
        else
            k=k+1;
        end
    end
    i = i+1;
    prob_tree(i,:) = [p, zeros(1, w-length(p))];
    str_tree(i,:) = [s, zeros(1, w-length(s))];
    length_p = [length_p, length(p)];
end
sizeb(1:2) = size(str_tree);
tempstr = "";
temp2 = [];

for i= 1:sizeb(2)
    temp2 = [temp2,str_tree(1,i)];
end

e=1;
code_array(1,:) = str_tree(1,:);
for ifinal = 1:sizeb(2)
    code1 = [s1(ifinal),':'];
    code2 = [];
    for j = 1:sizeb(1)
        tempstr = "";
        for i1 = 1:sizeb(2)
            if str_tree(j,i1) == temp2(e)
                tempstr = str_tree(j,i1);
            end
            if tempstr == "" && str_tree(j,i1) == totalstr(j)
                tempstr = str_tree(j,i1);
            end
        end
        if tempstr == str_tree(j, length_p(j))
            code2 = [code2,'1'];
        elseif tempstr == str_tree(j, length_p(j)-1)
            code2 = [code2,'0'];
        end
        temp2(e) = tempstr;
    end
    code2 = fliplr(code2);
    code_array(2,e) = code2;
    code_total = [code1,code2];
    display(code_total) %display final codeword
    e = e+1;
end

encoded_out = "";
length_total = length(x)*size_of_str(2);

for k = 1:length_total
    location = find( str_to_char(k) == code_array(1,:));
    encoded_out = encoded_out + code_array(2,location);
end

input_sequence = encoded_out;
disp("Decoded input is: " + huffman_decoder(input_sequence, code_array));


% decode

function [decoded_output] = huffman_decoder(x, codeword_array)

char_input = char(x);
temp_cdword = "";
decoded_output = "";

for i = 1:length(char_input)
   temp_cdword = temp_cdword + convertCharsToStrings(char_input(i));
   location = find( temp_cdword == codeword_array(2,:) );
   if ~isempty(location)
       decoded_output = decoded_output + codeword_array(1,location);
       temp_cdword = "";
   end
end

end


function e = expectation(x)
if x <= 0
    e = 0;
elseif x > 0 && x <= 16
    e = (8*(x^2)-(x^3)/3)/128;
else
    e = 16/3;
end
end

function cdf = cdf(x)
if x <= 16 && x > 0
    cdf = (8*x-(x^2)/4)/64;
else
    cdf = 0;
end
end

function [a,x_i] = lloyd_max()
a = -1/2:1:16;
a(1) = 0;
for k = 1:1:100000
    for l = 1:1:16
        x_i(l) = (expectation(a(l+1)) - expectation(a(l))) / (cdf(a(l+1))-cdf(a(l))); 
    end
    for m = 2:1:16
        a(m) = 0.5*(x_i(m)+x_i(m-1));
    end
end
end