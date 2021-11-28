# data-structures-delphi
A Library of Generic, Interfaced, Data Structures Written in Delphi

All structures are generic.

All structures are accessible via interfaces for automatic reference counting.
* This simplifies memory management as there is no need to explicitly destroy things
* Particularly for immutable structures, this keep memory usage down because unused instances are automatically cleaned up by the memory manager once their reference count drops to zero

Known Deficiencies Include:
* Some immutable structures are implemented naively i.e. "mutable" operations result in a copy of the underlying data.
