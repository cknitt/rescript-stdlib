/* Copyright (C) 2015-2016 Bloomberg Finance L.P.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. */

/*** TODO: check with {!String.of_char} 
    it's quite common that we have
    {[ Caml_string_extern.of_char x.[0] ]}
    It would be nice to generate code as below    
    {[ x[0]
    ]}
*/

/* ATT: this relies on we encode `char' as int */
@val external of_char: char => string = "String.fromCharCode"
@get_index external get_string_unsafe: (string, int) => string = ""

@send external toUpperCase: string => string = "toUpperCase"
@send external of_int: (int, ~base: int) => string = "toString"
@send external slice: (string, int, int) => string = "slice"
@send external slice_rest: (string, int) => string = "slice"
@send external index_of: (string, string) => int = "indexOf"

@val
external of_small_int_array: (@as(json`null`) _, array<int>) => string = "String.fromCharCode.apply"

@val @variadic external of_small_int32_array: array<int> => string = "String.fromCharCode"

@send external lastIndexOf: (string, string) => int = "lastIndexOf" /* used in {!Caml_io} */

external get: (string, int) => char = "%string_safe_get"
external length: string => int = "%string_length"
external unsafe_get: (string, int) => char = "%string_unsafe_get"
external unsafe_set: (bytes, int, char) => unit = "%bytes_unsafe_set"

@send external repeat: (string, int) => string = "repeat"
