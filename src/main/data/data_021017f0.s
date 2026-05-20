; Brief 161 part 2 — rewritten from brief 155 .c bundle so
; subsumed `data_021017f4` exports for downstream Pattern 3
; chunks (brief 158 collision fix).
;
; Bundle covers [0x021017f0..0x021017fc) = 12 bytes:
;   - data_021017f0 (zero, brief 155 value=0 W6-rejected anchor)
;   - data_021017f4 ("pid_" string fragment, the non-zero neighbour
;     absorbed to force .data emission)
;   - +8: trailing zero (unnamed)
;
; kind:load reloc origins (unchanged from brief 155 — patch_module_literals.py
; still resolves both at post-link):
;   - 0x021017f0: from 0x02101928
;   - 0x021017f4: from 0x02101994

        .data

        .global data_021017f0
data_021017f0:
        .word 0x00000000

        .global data_021017f4
data_021017f4:
        .word 0x5f646970
        .word 0x00000000
