#pragma once
#include <iostream>
#include <string>
#include <fstream>
#include <sys/time.h>

#include <libxpgraph.h>

#include "breadth_first_search.hpp"
#include "pr_gapbs.hpp"
#include "connected_components.hpp"

inline double mywtime()
{
	double time[2];	
	struct timeval time1;
	gettimeofday(&time1, NULL);

	time[0]=time1.tv_sec;
	time[1]=time1.tv_usec;

	return time[0] + time[1]*1.0e-6;
}

#ifndef EXPOUT
#define EXPOUT "[EXPOUT]"
#endif

void test_graph_benchmarks_gapbs(XPGraph* xpgraph){
    auto st = mywtime();
    for(size_t i=0; i<20; i++)
        test_bfs_numa(xpgraph, i);
    auto ts1 = mywtime();

    auto res = pr_gapbs(xpgraph, 10);
    auto ts2 = mywtime();
    delete [] res;

    auto ts3_st = mywtime();
    test_connected_components_numa(xpgraph, 2);
    auto ts3 = mywtime();
    
    auto t_bfs = ts1 - st;
    auto t_pr = ts2 - ts1;
    auto t_cc = ts3 - ts3_st;

    printf(EXPOUT "BFS: %.3fs\n", t_bfs);
    printf(EXPOUT "PR: %.3fs\n", t_pr);
    printf(EXPOUT "CC: %.3fs\n", t_cc);
}
