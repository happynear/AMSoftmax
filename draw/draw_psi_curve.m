theta = 0:1:180;
figure(1);
plot(theta, cosd(theta),'LineWidth',2);
hold on;
Fai = zeros(4,length(theta));
for m=[2 4]
    for k=0:m-1
        Fai(m,theta >= k * 180 / m & theta <= (k+1)*180/m) = (-1)^k * cosd(m*theta(theta >= k * 180 / m & theta <=(k+1)*180/m)) - 2 * k;
    end;
    plot(theta, Fai(m,:),'LineWidth',2);
end;
m=4;
lambda=5;
plot(theta, (cosd(theta) * lambda + Fai(4, :)) / (1 + lambda),'LineWidth',2);
plot(theta, cosd(theta) - 0.35,'LineWidth',2);
hold off;
legend('Conventional Softmax','Angular Softmax (m=2, \lambda=0)','Angular Softmax (m=4, \lambda=0)', ['Angular Softmax (m=4, \lambda=' num2str(lambda) ')'], 'Additive Margin Softmax (m=0.35)');
xlabel('angle \theta');
ylabel('\psi(\theta)');