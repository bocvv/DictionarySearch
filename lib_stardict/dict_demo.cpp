 /*************************************************************************
      > File Name: fingertip_search.cpp
      > Author: Bowei Wang
      > Mail: wangbw@rd.netease.com
      > Created Time: 六  11/10 15:39:05 2021
  ************************************************************************/
#include <iostream>
#include <string>
#include <sys/time.h>

#include "cls_stardict.h"

#define MAX_WORD_SIZE 100

int main(int argc, char* argv[]) {
    // std::string dict_dirname = "dics/stardict-DrEye5in1-2.4.2";
    std::string dict_dirname = "dics/stardict-xiangya-medical-2.4.2";
    std::string dict_typo_txt = "dics/typo_dict_en.txt";
    ClsSDict *cls_dict{nullptr};

    cls_dict = new ClsSDict();
    cls_dict->load_dics(dict_dirname);
    cls_dict->read_typo_txt(dict_typo_txt);

    char inputs[MAX_WORD_SIZE];
    std::string word;
    std::string explain;

    std::cout << "Input the word which you want to search for!" << std::endl;
    std::cout << "Press esc to exit!" << std::endl;
    while (1) {
        std::cin >> inputs;
        word = inputs;

        struct timeval t = {0, 0};
        gettimeofday(&t, nullptr);
        double start_time = t.tv_sec + t.tv_usec * 1e-6;

        explain = cls_dict->lookup(word);

        gettimeofday(&t, nullptr);
        double end_time = t.tv_sec + t.tv_usec * 1e-6;
        std::cout << "查词耗时: " << (end_time - start_time) * 1000 << "ms" << std::endl;

        if (!explain.empty()) {
            std::cout << "释义如下：" << std::endl;
            std::cout << explain << std::endl;
        } else {
            std::cout << "词库中未收录该词！" << std::endl;
        }
        std::cout << "----------------------------------------------------------" << std::endl;
    }

    if (cls_dict != nullptr) {
        delete cls_dict;
        cls_dict = nullptr;
    }
}
