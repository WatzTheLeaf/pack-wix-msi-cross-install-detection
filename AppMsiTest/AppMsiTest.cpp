// AppMsiTest.cpp : Defines the entry point for the application.
//

#include "AppMsiTest.h"

using namespace std;

namespace fs = std::filesystem;

int main()
{
    std::string filePathA = "./Data/FolderA/A-install.flag";
    std::string filePathB = "./Data/FolderB/B-install.flag";

    std::cout << "Hello World !" << std::endl;

    // Vérifier si le fichier existe
    if (fs::exists(filePathA)) {
        std::cout << "A type installation detected !" << std::endl;
    }

    if (fs::exists(filePathB)) {
        std::cout << "B type installation detected !" << std::endl;
    }

    return 0;
}
