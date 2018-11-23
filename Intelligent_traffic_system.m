clear; 
%checking for an ambulance
 
 DNA = imread('5.jpg');
 subplot(2,2,1),imshow(DNA);
 
redChannel = DNA(:, :, 1);
greenChannel = DNA(:, :, 2);
blueChannel = DNA(:, :, 3);
 
redCount=0;
GrayCount=0;
 
 [redCount grayCount] = imhist(redChannel);
subplot(2, 2, 2);
imshow( DNA(:,:,1));
% calculating %age of red pixels in whole image and allocating time with
% respect to that
 
 n=0;
 
 red_dots = (DNA(:,:,1)==255); 
n_red_dots = sum(red_dots(:));
 
blue_dots = (DNA(:,:,3)==255);
n_blue_dots = sum(blue_dots(:));
 
green_dots = (DNA(:,:,2)==255); 
n_green_dots = sum(green_dots(:));
 
n=n_red_dots+n_blue_dots+n_green_dots;
 
percentage= n_red_dots/n *100;
 
%displaying green light for an emergency services
if (percentage <40 )
    
    display('ambulance detected');
    display('green light for 90 seconds'); 
    
else 
% timer allocation     
rgb=imread('5.jpg');
figure, imshow(rgb)
I=rgb2gray(rgb);
figure
imshow(I)
 I=im2double(I);
 [m n] = size(I);
  
  c = 2;
g =[0.5 0.7 0.9 1 2 3 4 5 6];
 
for r=1:length(g)
    
for p = 1 : m
 
    for q = 1 : n
        I3(p, q) = c * I(p, q).^ g(r);  
    
    end
end
 
end
 
figure(1), imshow(I3);
title('Power-law transformation');
xlabel('Gamma='),xlabel(g(r));
 
BW2=edge(I3,'canny');
I5=imresize(I3,[300 300]);
figure(2);imshow(BW2);
title('y edge detector image');
 
 
 rgb1=imread('traffic1.jpg');
figure,imshow(rgb1)
I1=rgb2gray(rgb1);
figure,imshow(I1)
  I1=im2double(I1)
  [m n] = size(I1)
  d = 2;
h =[0.5 0.7 0.9 1 2 3 4 5 6];
 
for s=1:length(h)
for y = 1 : m
    
    for z = 1 : n
        I2(y, z) = d * I1(y, z).^ h(s);  
    end
end
 
end
 
figure(3), imshow(I2);
title('Power-law transformation');
xlabel('Gamma='),xlabel(h(s));
BW1=edge(I2,'canny');
I6=imresize(I2,[300 300]);
figure(4),imshow(BW1);
title('y edge detector image');
 
OUTPUT_MESSAGE = ' RED for 90 seconds ';
    OUTPUT_MESSAGE2 = ' GREEN for 20 seconds ';
    OUTPUT_MESSAGE3 = ' GREEN for 30 seconds ';
     OUTPUT_MESSAGE4 = ' GREEN for 60 seconds ';
     OUTPUT_MESSAGE5 = ' GREEN for 90 seconds ';
     
     
     matched_data = 0;
     white_points1 = 0;
     white_points2 = 0;
     black_points1 = 0;
     black_points2 = 0;
     x=0;
     y=0;
     l=0;
     m=0;
     time=0;
 
for a = 1:1:300
    for b = 1:1:300
        if(BW1(a,b)==1)
            white_points1 = white_points1+1;
        else
            black_points1 = black_points1+1;
        end
    end
end
 
for a = 1:1:300
    for b = 1:1:300
        if(BW2(a,b)==1)
            white_points2 = white_points2+1;
        else
            black_points2 = black_points2+1;
        end
    end
end
 
display(white_points1);
display(white_points2);
 
%total_data = white_points;
 
total_matched_percentage = (white_points1/white_points2)*100;
 
%displaying messages with respect to percentage matched
 
 display((total_matched_percentage));
 
 if total_matched_percentage > 90        
 
total_matched_percentage
OUTPUT_MESSAGE
display(OUTPUT_MESSAGE);
 
elseif total_matched_percentage <= 90 & total_matched_percentage > 70
    
 total_matched_percentage
 OUTPUT_MESSAGE2
 
display(OUTPUT_MESSAGE2);
 
 elseif total_matched_percentage <= 70 & total_matched_percentage > 50
     
 total_matched_percentage
 OUTPUT_MESSAGE3
 
 display(OUTPUT_MESSAGE3);
 
  elseif total_matched_percentage <= 50 & total_matched_percentage > 10
      
   total_matched_percentage
 OUTPUT_MESSAGE4
 
 display(OUTPUT_MESSAGE4);
  
  else
      total_matched_percentage
       OUTPUT_MESSAGE5
       
       display(OUTPUT_MESSAGE5);
 
 end  
end
