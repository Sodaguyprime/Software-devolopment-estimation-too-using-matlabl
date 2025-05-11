function ResultPlot(fileSize)
BW = 1:1:100; %Bandwidth
UploadTime = (fileSize * 8) ./ BW / 60;

f2 = figure;
%for semilogy: 
subplot(2,1,1);
semilogy(BW, UploadTime, 'r', 'LineWidth', 1);
grid on;
title('Upload Time vs Bandwidth (semilogy plot)');
xlabel('Bandwidth(Mbps)');
ylabel('Upload Time(Min)');
%Normal plot:
subplot(2,1,2);
plot(BW, UploadTime, 'b', 'LineWidth', 1);
grid on;
title('Upload Time vs Bandwidth (normal plot)');
xlabel('Bandwidth (Mbps)');
ylabel('Upload Time (Mins)');

% now for 3rd surface plot: (not sure abt it)
[X, Y] = meshgrid(1:10:1000, 1:1:100); %LOC vs BW
Z = (X * 0.05 * 8) ./ Y / 60;

f1 = figure;
surf(X, Y, Z);
xlabel('LOC');
ylabel('Bandwidth(Mbps)');
zlabel('Upload Time (Min)');
title('Surface Plot of Upload Time');
grid on;
saveas(f1,'surfice plot','jpg');
saveas(f2,'Upload time','jpg');
end