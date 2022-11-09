filename = "beethoven.wav";
filename2 = "imres4.wav";
[music1,fs1] = audioread(filename);
[im_res,fs2] = audioread(filename2);
im_res = resample(im_res,48000,44100);
output1 = conv2(im_res,music1(1*fs1:33*fs1)/6);
time = 0:1/fs1:(length(music1(1*fs1:33*fs1))-1)/fs1;
time_res = 0:1/fs1:(length(im_res)-1)/fs1;
time_odeon = 0:1/fs1:(length(output1)-1)/fs1;

figure(1);
plot(time,music1(1*fs1:33*fs1));
xlabel("time(seconds)")
ylabel("amplitude")
axis tight
title("amplitude vs time (input)")

figure(2);
plot(time_res,im_res);
xlabel("time(seconds)")
ylabel("amplitude")
axis tight
title("amplitude vs time(impulse response)")

figure(3);
plot(time_odeon,output1);
xlabel("time(seconds)")
ylabel("amplitude")
axis tight
title("amplitude vs time (Output)")
% audiowrite("bethovencut.wav", music1(1*fs1:33*fs1),48000);
% audiowrite("beethoven_conv.wav",output1,48000);
sound(output1,fs1);