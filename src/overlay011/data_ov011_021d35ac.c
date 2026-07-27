/* data_ov011_021d35ac (28 bytes, 4-aligned): signedness fix, not a shape
 * change, as part of cm-data-inference-6. 14 {row,col} 1-indexed pairs
 * (grid cell selectors, (0,0)-terminated), consumed as flat base+i*2
 * addressing by 3 walled .s functions -- func_ov011_021d18b4.s:14-21,35,
 * func_ov011_021d1b70.s:31-34,90, func_ov011_021d191c.s:80-83,92,163 --
 * every one of the 4 load sites uses `ldrsb` (signed-byte load), not
 * `ldrb`, so `unsigned char` was the wrong element type; `signed char`
 * is required for a future C match of any of the 3 consumers to
 * reproduce `ldrsb`. relocs.txt confirms clean symbol boundaries on
 * both sides (unlike sibling data_ov011_021d3178/021d3394).
 */

const signed char data_ov011_021d35ac[28] = {
    1, 1, 1, 2, 2, 1, 2, 2, 2, 3, 3, 1,
    3, 2, 3, 3, 4, 1, 4, 2, 4, 3, 5, 1,
    5, 2, 0, 0,
};
