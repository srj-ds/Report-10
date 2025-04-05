clc; close all; clear;
% Load the image
img = imread("catherine.jpg");

% Convert the image to grayscale for better detection (optional but recommended)
grayImg = rgb2gray(img);

% Create a cascade detector object with a specific model
faceDetector = vision.CascadeObjectDetector(); % Default detects frontal faces

% Adjust the 'MinSize' and 'MergeThreshold' parameters for better accuracy
faceDetector.MinSize = [50, 50]; % Minimum size of faces to detect (adjust as needed)
faceDetector.MergeThreshold = 5; % Higher value reduces false positives

% Detect faces
bbox = step(faceDetector, grayImg);

% Check if any faces are detected
if isempty(bbox)
    disp('No faces detected.');
else
    % Annotate detected faces in the image with thicker boxes
    thickness = 5; % Specify the thickness of the box
    detectedImg = insertShape(img, 'Rectangle', bbox, 'Color', 'green', 'LineWidth', thickness);

    % Display the result
    figure;
    imshow(detectedImg);
    title('Detected Faces');
end
