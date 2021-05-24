[x,y]=uigetfile({'*.jpg;*.bmp;*.png;*.tif;*.jpeg;'},'Select an image');
s=[y,x];
im=imread(s);
[x,y,z]=size(im);

  figure;hold on;
  imshow(im);
  
  cropped_im=im(x/2-50:x/2+50,y/2-50:y/2+50,:);
  
  %[probab,image_histogram]=imhist(image_grayscale);
  %figure;
  %hold on;
  %title('Histogram of Grayscale');
  %stem(image_histogram,probab);
  %ot=otsuthresh(probab);
  %figure;
  %hold on;
  %ot1=im2bw(image_grayscale,ot);
  %imshow(ot1);
  
  m_red=mean(cropped_im(:,:,1),'all');
  %m_green=mean(cropped_im(:,:,2),'all')
  %m_blue=mean(cropped_im(:,:,3),'all')
   

 turb=-123.03*exp(-m_red/202.008)-184.47115*exp(-m_red/1157.359)+313.5892;
  %turb= 2094.06*exp(-m_red/250)-328.52;
  %turb_green= 2157.16*exp(-m_green/122.32)
  %turb_blue= 2144.49*exp(-m_blue/103.579)
 
 turbidity_out= round(-10.03*turb+1274.35); 
 Message=sprintf('Turbidity(in NTU): %d NTU',turbidity_out);
 msgbox(Message);

