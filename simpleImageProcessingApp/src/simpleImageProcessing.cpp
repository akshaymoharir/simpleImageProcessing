

#include <iostream>
#include "opencv2/opencv.hpp"

int main(int argc, char** argv)
{
    // Create a videocapture object
    cv::VideoCapture video("sampleVideo.mov");
    
    if(!video.isOpened())
    {
        std::cout << "sampleVideo is not opened. Error occurred" << std::endl;
        return -1;
    }
    
    // Get frame height and width
    unsigned int frameWidth    = video.get(CV_CAP_PROP_FRAME_WIDTH);
    unsigned int frameHeight   = video.get(CV_CAP_PROP_FRAME_HEIGHT);
    
    // VideoWriter object
    cv::VideoWriter myVideoWriter("processedSampleVideo.avi", CV_FOURCC('H','2','6','4'), 30, cv::Size(frameWidth,frameHeight));
    
    cv::Mat frame;
    bool escape_pressed     = false;
    unsigned int frameCount  = 0;
    unsigned int numOfFramesInVideo = 1000;//video.get(CAP_PROP_FRAME_COUNT);
    
    // Capture and display frame until user requests exit
    while((!escape_pressed)||(frameCount<=1000))
    {
        // Capture the frame
        video >> frame;
        
        // Increase frame count
        frameCount++;
        std::cout << "Progress: "<< (int) ((frameCount*100/numOfFramesInVideo)) << "% . Processing frame: " << frameCount << std::endl;
        
        // If frame is empty, return with error
        if(frame.empty())
        {
            std::cout << "\nFrame is empty. Video has ended." << std::endl;
            break;
        }
        
        // Display frame
        //cv::imshow("Frame", frame);
        
        // Write frame into video
        myVideoWriter.write(frame);
        
        // Check if escape is pressed
        char k = 1;//cv::waitKey(1);
        if (k == 27)
        {
            escape_pressed = true;
            std::cout << "Escape pressed. Exit requested by user." << std::endl;
        }
    }
    
    // Release VideoCapture object
    video.release();
    
    // Release VideoWriter object
    myVideoWriter.release();
    
    // Distroy GUI windows
    cv::destroyAllWindows();
    
    return 0;
}

