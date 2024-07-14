t1 = me.Id{2};
time=t1(:,1);
time=table2array(time);
u1 = t1(:, 2);
u1=table2array(u1);
m1 = zeros(1, 10001);
for i = 1:10001
    m1(i) = u1(i);
end
m1=transpose(m1);
plot(time,m11);

