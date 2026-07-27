/* func_ov002_02247670: recursive subset-reachability search. Scans arr[n..0];
 * if arr[i] < target, recurses on the remaining prefix with a reduced
 * target and a tightened budget (min(budget, arr[i])), unless i==0. Else
 * (arr[i] >= target), succeeds if arr[i] < target+budget. */
int func_ov002_02247670(int *arr, int n, int target, int budget) {
    if (n < 0)
        goto return_zero;

    {
        int upper = target + budget;
        do {
            int v = arr[n];
            if (v < target) {
                if (n != 0) {
                    int newBudget = (budget < v) ? budget : v;
                    if (func_ov002_02247670(arr, n - 1, target - v, newBudget) != 0)
                        return 1;
                }
            } else {
                if (v < upper)
                    return 1;
            }
            n--;
        } while (n >= 0);
    }

return_zero:
    return 0;
}
