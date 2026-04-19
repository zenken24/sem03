# DSA Master Study Pack (Exam-Oriented)

Topics covered:
1. Hashing
2. Binary Heap
3. AVL Tree
4. Range Queries (Prefix Sum, Sparse Table, Segment Tree)
5. DSU (Disjoint Set Union)
6. String Hashing and Trie

Each topic includes:
- Easy theory with examples
- Diagram(s)
- Question bank: Easy (10) + Medium (10) + Difficult (10)
- Answers included for every question
- Question styles included in every topic:
  - Definition, Analysis, Complexity, Theoretical reasoning
  - Scenario-based DS choice + how to apply + pseudo code
  - Pseudo code for operations/applications
  - Simulation/apply on data

---

## 1) Hashing

### Theory (Easy)
A hash table stores data as key-value pairs and tries to access data in O(1) average time.

- Hash function: converts a key into an index.
- Collision: two keys map to same index.
- Collision handling:
  - Separate chaining (linked list/vector per bucket)
  - Open addressing (linear/quadratic/double hashing)
- Load factor: lambda = n / m
  - n = number of stored keys
  - m = table size

Example:
- table size m = 10
- hash(x) = x mod 10
- keys: 15, 25, 37
- indices: 5, 5, 7
- collision at index 5 (15 and 25)

### Diagram
```text
Hash table (size 7), separate chaining:

0 -> [ ]
1 -> [22] -> [15]
2 -> [ ]
3 -> [10]
4 -> [ ]
5 -> [26] -> [5]
6 -> [ ]

hash(x) = x mod 7
22 mod 7 = 1, 15 mod 7 = 1
```

### Question Bank

#### Easy (10)
1. [Definition] What is hashing?
- Answer: Hashing maps a key to an array index so we can store/find data fast.

2. [Definition] What is a hash function?
- Answer: A function that takes a key and returns an index in the hash table.

3. [Complexity] Average complexity of search/insert/delete in good hashing?
- Answer: O(1) average for all three.

4. [Definition] What is a collision?
- Answer: When two different keys map to the same index.

5. [Analysis] Define load factor.
- Answer: lambda = n/m, where n is number of keys and m is table size.

6. [Scenario] You need very fast username lookup by user ID. Choose DS.
- Answer: Hash table, because average O(1) lookup.

7. [Pseudo code] Write insert for separate chaining.
- Answer:
```text
idx = hash(key)
bucket[idx].push_front(key)
```

8. [Pseudo code] Write search in separate chaining.
- Answer:
```text
idx = hash(key)
for x in bucket[idx]:
    if x == key: return true
return false
```

9. [Simulation] m=10, hash=x mod 10, insert 11,21,34. Buckets?
- Answer: 11->1, 21->1, 34->4.

10. [Theoretical reasoning] Why can worst case become O(n)?
- Answer: If all keys collide into one bucket, search becomes linear.

#### Medium (10)
1. [Analysis] Compare separate chaining vs linear probing.
- Answer: Chaining stores colliding keys in linked lists; probing finds next empty slot in same table.

2. [Complexity] Expected complexity in chaining with load factor lambda.
- Answer: Successful search is about O(1 + lambda).

3. [Scenario] Need deletions often, table can exceed load >1. Best method?
- Answer: Separate chaining, easier delete and supports lambda > 1.

4. [Pseudo code] Rehash trigger condition and action.
- Answer:
```text
if lambda > threshold:
    newTable = size*2 (or next prime)
    reinsert all keys using new hash
```

5. [Simulation] m=7, hash=x mod 7, insert 10,17,24,31 using chaining.
- Answer: all map to 3, chain at bucket 3: [31 -> 24 -> 17 -> 10] (if front insert).

6. [Theoretical reasoning] Why prime table size is often used?
- Answer: It reduces regular collision patterns for many key distributions.

7. [Scenario] Need fixed memory, no pointer overhead. Choose method.
- Answer: Open addressing (e.g., linear probing).

8. [Pseudo code] Linear probing search.
- Answer:
```text
idx = hash(key)
for i in 0..m-1:
    j = (idx+i) mod m
    if table[j] is EMPTY: return false
    if table[j] == key: return true
return false
```

9. [Analysis] What is primary clustering?
- Answer: In linear probing, continuous filled blocks grow and increase future collisions.

10. [Complexity] Why probing slows when load factor nears 1?
- Answer: Few empty cells remain, probe sequences get longer.

#### Difficult (10)
1. [Theoretical reasoning] Why double hashing reduces clustering?
- Answer: Different step sizes spread probe sequences, reducing overlap.

2. [Complexity] Give expected performance trend as lambda approaches 1 for open addressing.
- Answer: Search/insert degrade sharply toward O(n) behavior.

3. [Scenario] Build symbol table for compiler with many inserts/lookups and occasional resize.
- Answer: Hash table with chaining and periodic rehashing.

4. [Pseudo code] Delete in open addressing with tombstones.
- Answer:
```text
find slot of key
if found: mark as DELETED (tombstone)
```

5. [Simulation] m=11, linear probing, hash=x mod 11, insert 22,33,44,55.
- Answer: 22->0, 33->0->1, 44->0->1->2, 55->0->1->2->3.

6. [Analysis] Why deleting by making slot EMPTY is wrong in probing?
- Answer: It breaks probe chains and may cause false "not found".

7. [Scenario] Millions of string keys, memory sensitive, mostly search.
- Answer: Open addressing with good hash and low load factor.

8. [Pseudo code] Universal hashing idea.
- Answer:
```text
pick random function h from family H at runtime
use h for all operations
```

9. [Theoretical reasoning] Why rehashing cost is amortized?
- Answer: Expensive resize happens rarely; spread over many O(1) inserts.

10. [Simulation] chaining delete: bucket[4]=[18->11->4], delete 11.
- Answer: bucket[4] becomes [18->4].

---

## 2) Binary Heap

### Theory (Easy)
Binary heap is a complete binary tree stored in an array.

- Min-heap: parent <= children
- Max-heap: parent >= children
- Complete tree: all levels full except last, filled left to right
- Common for priority queue

Array relations (0-based):
- left(i) = 2i + 1
- right(i) = 2i + 2
- parent(i) = floor((i-1)/2)

Complexities:
- get min/max: O(1)
- insert: O(log n)
- extract min/max: O(log n)
- build heap: O(n)

Example (min-heap array): [2, 5, 7, 9, 12, 11]

### Diagram
```text
Min-Heap:
        2
      /   \
     5     7
    / \   /
   9  12 11

Array: [2,5,7,9,12,11]
```

### Question Bank

#### Easy (10)
1. [Definition] What is a binary heap?
- Answer: A complete binary tree with heap order property.

2. [Definition] Min-heap property?
- Answer: Every parent key is <= its children.

3. [Complexity] Time for peek minimum in min-heap?
- Answer: O(1), at root.

4. [Complexity] Time for insertion?
- Answer: O(log n), due to bubble-up.

5. [Definition] Why complete tree matters?
- Answer: Enables compact array representation.

6. [Scenario] Need repeatedly smallest task first.
- Answer: Use min-heap priority queue.

7. [Pseudo code] Insert in min-heap.
- Answer:
```text
append x at end
while i>0 and a[parent(i)] > a[i]:
    swap(a[parent(i)], a[i])
    i = parent(i)
```

8. [Pseudo code] Extract-min core steps.
- Answer:
```text
ans = a[0]
a[0] = a[last]
remove last
heapifyDown(0)
return ans
```

9. [Simulation] Insert 3 into min-heap [5,8,9].
- Answer: append -> [5,8,9,3], bubble-up -> [3,5,9,8].

10. [Analysis] Why heap is good for priority queue?
- Answer: Fast top access and efficient updates.

#### Medium (10)
1. [Analysis] Difference between heap and BST.
- Answer: Heap gives fast min/max; BST gives ordered traversal/search.

2. [Complexity] Build-heap from n items complexity and reason.
- Answer: O(n), because many nodes are near leaves with small heapify cost.

3. [Scenario] Find k smallest numbers from huge stream.
- Answer: Use max-heap of size k.

4. [Pseudo code] Heapify-down in min-heap.
- Answer:
```text
while hasChild(i):
    c = smallerChild(i)
    if a[i] <= a[c]: break
    swap(a[i], a[c]); i=c
```

5. [Simulation] Extract-min from [1,4,3,9,6,7].
- Answer: remove 1, move 7 to root: [7,4,3,9,6], heapify -> [3,4,7,9,6].

6. [Theoretical reasoning] Why heap cannot support O(log n) search for arbitrary value?
- Answer: Heap only guarantees parent-child order, not full sorted ordering.

7. [Scenario] CPU scheduler with dynamic priorities.
- Answer: Heap-based priority queue.

8. [Pseudo code] Convert array to min-heap.
- Answer:
```text
for i from floor(n/2)-1 downto 0:
    heapifyDown(i)
```

9. [Complexity] Insertion worst-case swaps?
- Answer: Up to tree height = O(log n).

10. [Simulation] Build min-heap from [9,5,6,2].
- Answer: result min-heap [2,5,6,9].

#### Difficult (10)
1. [Theoretical reasoning] Why heapsort is O(n log n) and in-place?
- Answer: build O(n), then n extracts each O(log n); array used directly.

2. [Complexity] Compare d-ary heap vs binary heap for decrease-key.
- Answer: Higher d lowers height but increases child comparisons per step.

3. [Scenario] Dijkstra implementation priority structure?
- Answer: Min-heap keyed by tentative distance.

4. [Pseudo code] Decrease-key(i,newVal) in min-heap.
- Answer:
```text
a[i]=newVal
while i>0 and a[parent(i)]>a[i]:
    swap(a[parent(i)],a[i]); i=parent(i)
```

5. [Simulation] Max-heap insert sequence 10,4,15,20.
- Answer: [10] -> [10,4] -> [15,4,10] -> [20,15,10,4].

6. [Analysis] Why build-heap via repeated insert is O(n log n), but bottom-up is O(n)?
- Answer: repeated insert does n bubble-ups; bottom-up heapifies mostly small subtrees.

7. [Scenario] Median of stream using heaps.
- Answer: max-heap for lower half + min-heap for upper half.

8. [Pseudo code] Median maintenance rebalance.
- Answer:
```text
insert x into proper heap
if size diff >1: move top from larger to smaller
median = top of larger or avg(tops)
```

9. [Simulation] Extract max from [50,30,40,10,20].
- Answer: remove 50, move 20 -> [20,30,40,10], heapify -> [40,30,20,10].

10. [Theoretical reasoning] Why heap is not stable sorting base?
- Answer: Equal keys may change relative order during swaps.

---

## 3) AVL Tree

### Theory (Easy)
AVL tree is a self-balancing BST.

- BST rule: left < root < right
- Balance factor BF = height(left) - height(right)
- AVL condition: BF must be -1, 0, or 1 for every node
- If violated, rotate:
  - LL: right rotation
  - RR: left rotation
  - LR: left then right
  - RL: right then left

Complexities:
- search, insert, delete: O(log n)

Example:
Insert 30, 20, 10
- Tree becomes left-heavy at 30 (LL case)
- Right rotate at 30
- New root: 20

### Diagram
```text
LL imbalance:
    30              20
   /      ->       /  \
  20              10  30
 /
10

Right rotation at 30
```

### Question Bank

#### Easy (10)
1. [Definition] What is AVL tree?
- Answer: A BST that keeps itself height-balanced after updates.

2. [Definition] What is balance factor?
- Answer: BF = height(left) - height(right).

3. [Complexity] AVL search complexity?
- Answer: O(log n).

4. [Definition] Allowed BF values in AVL?
- Answer: -1, 0, +1.

5. [Analysis] Why AVL is faster than plain BST in worst case?
- Answer: AVL avoids skewed height O(n).

6. [Scenario] Need sorted traversal + fast search updates.
- Answer: AVL tree.

7. [Pseudo code] BST search steps in AVL.
- Answer:
```text
if root null return false
if key==root.key return true
if key<root.key go left else go right
```

8. [Simulation] Insert 10,20,30 into AVL.
- Answer: RR imbalance at 10, left rotate -> root 20 with children 10 and 30.

9. [Definition] What is rotation?
- Answer: Local pointer rearrangement to restore balance.

10. [Theoretical reasoning] Why inorder traversal is sorted?
- Answer: AVL is still BST, so inorder yields ascending keys.

#### Medium (10)
1. [Analysis] Differentiate LL, RR, LR, RL cases.
- Answer: Based on heavy side and child direction; LL/RR single rotation, LR/RL double.

2. [Complexity] Insert in AVL complexity including rebalancing.
- Answer: O(log n).

3. [Scenario] Leaderboard with ordered ranks and frequent updates.
- Answer: AVL or balanced BST.

4. [Pseudo code] Rebalance after insertion outline.
- Answer:
```text
update height
bf = h(left)-h(right)
if bf>1 and key<left.key: rightRotate
if bf<-1 and key>right.key: leftRotate
if bf>1 and key>left.key: leftRotate(left), rightRotate
if bf<-1 and key<right.key: rightRotate(right), leftRotate
```

5. [Simulation] Insert 30,10,20.
- Answer: LR case at 30: left rotate 10, then right rotate 30 -> root 20.

6. [Theoretical reasoning] Why at most one path needs recheck after insert?
- Answer: Only ancestors of inserted node can change height.

7. [Scenario] Need predecessor/successor often.
- Answer: AVL supports both in O(log n).

8. [Pseudo code] Find min in AVL.
- Answer:
```text
cur=root
while cur.left != null: cur=cur.left
return cur
```

9. [Analysis] Why deletion in AVL is harder than insertion?
- Answer: Height reductions can propagate and require multiple rebalances upward.

10. [Simulation] Delete a leaf in balanced AVL and check BF.
- Answer: remove leaf, update heights upward, rotate if any BF out of range.

#### Difficult (10)
1. [Theoretical reasoning] AVL height upper bound significance.
- Answer: Height remains Theta(log n), guaranteeing logarithmic operations.

2. [Complexity] Compare AVL vs Red-Black for search-heavy workload.
- Answer: AVL usually better search constants due to stricter balance.

3. [Scenario] In-memory index with very frequent reads, moderate writes.
- Answer: AVL favored for tighter height.

4. [Pseudo code] AVL delete with successor replacement outline.
- Answer:
```text
delete BST style
if two children: swap with inorder successor and delete successor
update height
rebalance by bf cases
```

5. [Simulation] Insert 50,30,70,20,40,10. Identify rotation.
- Answer: Node 50 becomes LL-heavy via 30->20->10 path, right rotate at 50.

6. [Analysis] Why rotations preserve BST order?
- Answer: Subtree key ranges remain in valid relative intervals.

7. [Scenario] Need rank/select by order statistic too.
- Answer: AVL + subtree sizes augmentation.

8. [Pseudo code] kth smallest with subtree size.
- Answer:
```text
leftSize = size(node.left)
if k==leftSize+1 return node
if k<=leftSize go left
else go right with k-leftSize-1
```

9. [Simulation] RL case sequence 10,30,20.
- Answer: RL at 10: right rotate at 30 then left rotate at 10 -> root 20.

10. [Theoretical reasoning] Why plain BST can degrade to linked list?
- Answer: Sorted insertion order creates one-sided chain.

---

## 4) Range Queries (Prefix Sum, Sparse Table, Segment Tree)

### Theory (Easy)
Range query asks answer on subarray [l..r], like sum/min/max.

Prefix Sum:
- Precompute prefix[i] = sum(0..i)
- Query sum(l,r) = prefix[r] - prefix[l-1]
- Build O(n), query O(1), updates expensive if many

Sparse Table (static array):
- For idempotent ops (min/max/gcd)
- Build O(n log n), query O(1), update not efficient

Segment Tree:
- Dynamic updates + range query
- Build O(n), query O(log n), update O(log n)

Example:
arr = [2,4,1,5,3]
prefix = [2,6,7,12,15]
sum(1,3) = 12 - 2 = 10

### Diagram
```text
Segment tree for sum of [2,4,1,5]:

          [0,3]=12
         /        \
    [0,1]=6      [2,3]=6
     /   \        /    \
 [0,0]=2 [1,1]=4 [2,2]=1 [3,3]=5
```

### Question Bank

#### Easy (10)
1. [Definition] What is a range query?
- Answer: Query asking result over subarray interval [l..r].

2. [Definition] Prefix sum meaning?
- Answer: prefix[i] stores sum from index 0 to i.

3. [Complexity] Prefix sum query complexity?
- Answer: O(1).

4. [Complexity] Segment tree point update complexity?
- Answer: O(log n).

5. [Definition] Sparse table best suited for?
- Answer: Static arrays with min/max/gcd queries.

6. [Scenario] Array never changes, many RMQ(min) queries.
- Answer: Sparse table.

7. [Pseudo code] Prefix build.
- Answer:
```text
prefix[0]=a[0]
for i in 1..n-1: prefix[i]=prefix[i-1]+a[i]
```

8. [Pseudo code] Prefix range sum.
- Answer:
```text
if l==0 return prefix[r]
return prefix[r]-prefix[l-1]
```

9. [Simulation] a=[1,2,3,4], sum(1,3)?
- Answer: 2+3+4=9.

10. [Analysis] Why prefix sum bad for frequent updates?
- Answer: Updating one element may require O(n) prefix fixes.

#### Medium (10)
1. [Analysis] Prefix vs segment tree for dynamic sums.
- Answer: Segment tree better due O(log n) update.

2. [Complexity] Sparse table build/query.
- Answer: Build O(n log n), query O(1).

3. [Scenario] Online stock corrections and range sums.
- Answer: Segment tree.

4. [Pseudo code] Segment tree query combine.
- Answer:
```text
if disjoint return 0
if fully inside return tree[node]
return query(left)+query(right)
```

5. [Simulation] Query [1,2] in arr=[2,4,1,5].
- Answer: sum=4+1=5.

6. [Theoretical reasoning] Why sparse table needs idempotent op for O(1) two-block query?
- Answer: Overlap must not change result (e.g., min(x,x)=x).

7. [Scenario] Need range min only, no updates, huge Q.
- Answer: Sparse table.

8. [Pseudo code] Segment tree point update.
- Answer:
```text
if leaf: tree[node]=val
else update child then tree[node]=left+right
```

9. [Analysis] Why Fenwick tree can also do prefix sums efficiently?
- Answer: It stores partial sums enabling O(log n) update/query.

10. [Simulation] prefix of [3,1,4,2].
- Answer: [3,4,8,10].

#### Difficult (10)
1. [Theoretical reasoning] Lazy propagation purpose.
- Answer: Delay range updates to avoid visiting all affected leaves immediately.

2. [Complexity] Segment tree with lazy: range update/query.
- Answer: O(log n) each.

3. [Scenario] Massive interval add operations + interval sum queries.
- Answer: Segment tree with lazy propagation.

4. [Pseudo code] Lazy push.
- Answer:
```text
if lazy[node]!=0:
    apply to children
    lazy[node]=0
```

5. [Simulation] Update +2 on [1,3] for [1,1,1,1], then sum(0,3).
- Answer: array becomes [1,3,3,3], sum=10.

6. [Analysis] Why sparse table cannot handle frequent updates well?
- Answer: A single update can invalidate many precomputed intervals.

7. [Scenario] Need both min and count of min in range with updates.
- Answer: Segment tree storing pair(min,count).

8. [Pseudo code] Combine for min+count.
- Answer:
```text
if left.min < right.min return left
if right.min < left.min return right
return (min=left.min, count=left.count+right.count)
```

9. [Simulation] RMQ using sparse table on [5,2,6,1,3], min(1,4).
- Answer: 1.

10. [Theoretical reasoning] Why divide-and-conquer tree structure gives log depth?
- Answer: Each level halves interval size.

---

## 5) DSU (Disjoint Set Union)

### Theory (Easy)
DSU tracks partition of elements into disjoint groups.

Core operations:
- makeSet(x): create set {x}
- find(x): returns representative (root)
- union(a,b): merge sets if different

Optimizations:
- Path compression in find
- Union by rank/size

Complexity:
- Amortized almost O(1), formally O(alpha(n))

Example:
- Sets: {1},{2},{3},{4}
- union(1,2), union(3,4), union(2,3)
- final one set: {1,2,3,4}

### Diagram
```text
Parent array view:
Initially: parent[i]=i

After unions:
1 -> 2 -> 4
3 -> 4
4 -> 4 (root)

find(1) compresses path: 1 -> 4 directly
```

### Question Bank

#### Easy (10)
1. [Definition] What does DSU do?
- Answer: Maintains disjoint groups and supports merge/connect checks.

2. [Definition] find(x) returns what?
- Answer: Representative/root of x's set.

3. [Definition] union(a,b) effect?
- Answer: Merges the two sets if roots differ.

4. [Complexity] DSU optimized complexity?
- Answer: Amortized O(alpha(n)).

5. [Analysis] Why path compression helps?
- Answer: It flattens tree paths for faster future finds.

6. [Scenario] Need to check if two users are in same friend group.
- Answer: DSU with find(u)==find(v).

7. [Pseudo code] Basic find with compression.
- Answer:
```text
if parent[x]==x return x
parent[x]=find(parent[x])
return parent[x]
```

8. [Pseudo code] Union by size.
- Answer:
```text
ra=find(a), rb=find(b)
if ra==rb return
if size[ra]<size[rb] swap(ra,rb)
parent[rb]=ra
size[ra]+=size[rb]
```

9. [Simulation] n=4, union(1,2), union(2,3). Are 1 and 3 connected?
- Answer: Yes.

10. [Theoretical reasoning] Why DSU good for connectivity additions?
- Answer: Fast merge and connectivity checks.

#### Medium (10)
1. [Analysis] Rank vs size heuristic.
- Answer: Both keep trees shallow; rank approximates height, size uses subtree size.

2. [Complexity] Why alpha(n) treated as constant in practice?
- Answer: It grows extremely slowly (<5 for huge n).

3. [Scenario] Kruskal MST needs what DS operation?
- Answer: Check cycle by find(u)!=find(v), then union(u,v).

4. [Pseudo code] Kruskal core.
- Answer:
```text
sort edges by weight
for (u,v,w):
    if find(u)!=find(v):
        take edge
        union(u,v)
```

5. [Simulation] parent=[1,2,3,4], unions (1,2),(3,4),(2,3). components?
- Answer: 1 component.

6. [Scenario] Dynamic island counting as cells added.
- Answer: DSU over grid IDs, union neighbors.

7. [Pseudo code] Same-set query.
- Answer:
```text
connected(a,b) = (find(a)==find(b))
```

8. [Analysis] Why DSU cannot directly handle deletions?
- Answer: Union is easy; undo split is hard without rollback structures.

9. [Simulation] If find(5) path is 5->3->1, after compression?
- Answer: 5->1 and 3->1.

10. [Theoretical reasoning] Why representative ID can change after unions?
- Answer: Root chosen by heuristic may vary.

#### Difficult (10)
1. [Scenario] Offline connectivity with add/remove edges.
- Answer: Use DSU rollback + divide and conquer over time.

2. [Complexity] DSU rollback trade-off.
- Answer: Supports undo, but no full path compression or careful logging needed.

3. [Pseudo code] Rollback idea.
- Answer:
```text
on union, push changed parent/size on stack
to rollback, pop and restore
```

4. [Simulation] Weighted DSU with equation y-x=3; merge constraints.
- Answer: Store relative offsets to root; on union fix root offset relation.

5. [Analysis] Why union-find ideal for incremental connectivity but not shortest path?
- Answer: It stores component membership only, not path lengths.

6. [Scenario] Detect first redundant edge in undirected graph.
- Answer: If find(u)==find(v), edge is redundant; else union.

7. [Pseudo code] Count components after m unions.
- Answer:
```text
comp=n
for each union(a,b): if find(a)!=find(b): union(a,b); comp--
```

8. [Theoretical reasoning] Effect of random unions without heuristic.
- Answer: Can build tall trees, making operations slower.

9. [Simulation] n=5 unions: (1,2),(2,3),(4,5). Number of sets?
- Answer: 2 sets: {1,2,3} and {4,5}.

10. [Analysis] Why DSU + sorting solves Kruskal optimally?
- Answer: Greedy smallest edge that does not form cycle preserves MST optimality.

---

## 6) String Hashing and Trie

### Theory (Easy)
String Hashing:
- Convert string to numeric hash for fast comparison/search.
- Rolling hash allows O(1) substring hash after O(n) preprocessing.
- Common polynomial hash:
  - H(s) = sum((s[i]-'a'+1)*p^i) mod M

Trie (prefix tree):
- Tree where each edge is a character.
- Path from root forms prefix.
- Fast prefix queries.

Complexities:
- Trie insert/search/prefix: O(L), L = word length
- Rolling hash substring compare: O(1) after preprocessing

Example Trie words:
- cat, car, dog
- c-a-t and c-a-r share prefix c-a

### Diagram
```text
Trie:
(root)
  |- c
  |   |- a
  |       |- t*   (cat)
  |       |- r*   (car)
  |- d
      |- o
          |- g*   (dog)

* means end-of-word
```

### Question Bank

#### Easy (10)
1. [Definition] What is a trie?
- Answer: A tree storing strings character by character.

2. [Definition] What is prefix search?
- Answer: Finding words that start with given prefix.

3. [Complexity] Trie search complexity?
- Answer: O(L).

4. [Definition] Why end-of-word marker needed?
- Answer: To distinguish full word from just prefix.

5. [Definition] What is string hashing?
- Answer: Mapping string to numeric value for quick checks.

6. [Scenario] Autocomplete by prefix in dictionary.
- Answer: Trie.

7. [Pseudo code] Trie insert.
- Answer:
```text
cur=root
for ch in word:
    if child[ch] missing: create
    cur=child[ch]
cur.isEnd=true
```

8. [Pseudo code] Trie search exact.
- Answer:
```text
cur=root
for ch in word:
    if child[ch] missing: return false
    cur=child[ch]
return cur.isEnd
```

9. [Simulation] Insert "to", "tea", "ten". Common prefix?
- Answer: "te" shared by tea and ten; "t" shared by all.

10. [Analysis] Why hash collisions are possible?
- Answer: Different strings can map to same numeric hash.

#### Medium (10)
1. [Analysis] Trie vs hash map for word dictionary.
- Answer: Trie supports prefixes naturally; hash map supports exact lookup only.

2. [Complexity] Rolling hash preprocess and substring query.
- Answer: Preprocess O(n), each substring hash O(1).

3. [Scenario] Need many substring equality checks.
- Answer: Rolling hash (double hash for safety).

4. [Pseudo code] Prefix check in trie.
- Answer:
```text
cur=root
for ch in pref:
    if no child[ch]: return false
    cur=child[ch]
return true
```

5. [Simulation] Words: app, apple, apt. Prefix "ap" exists?
- Answer: Yes.

6. [Theoretical reasoning] Why use two mod values in hashing?
- Answer: Greatly reduces collision probability.

7. [Scenario] Need lexicographic listing of stored words.
- Answer: Trie DFS in character order.

8. [Pseudo code] Polynomial hash build.
- Answer:
```text
h[0]=0
for i in 1..n:
    h[i]=(h[i-1]*p + val(s[i])) mod M
```

9. [Analysis] Memory drawback of trie?
- Answer: Many nodes/pointers, can be large.

10. [Simulation] Search "car" when only "cat" exists.
- Answer: fails at third char ('r' missing).

#### Difficult (10)
1. [Theoretical reasoning] Why hashing alone cannot guarantee equality?
- Answer: Collision possibility; equal hash does not always imply equal strings.

2. [Complexity] Compare suffix array, trie, and hashing for pattern tasks (high level).
- Answer: Depends on query type; hashing fast comparisons, trie fast prefix, suffix structures robust substring indexing.

3. [Scenario] Need dynamic dictionary + wildcard single char '.' query.
- Answer: Trie with DFS branching on '.'.

4. [Pseudo code] Double hash substring compare.
- Answer:
```text
eq(l1,r1,l2,r2) = (hash1(l1,r1)==hash1(l2,r2)) and (hash2(l1,r1)==hash2(l2,r2))
```

5. [Simulation] Rolling hash base p=31, mod 1e9+7 for "ab".
- Answer: H = 1*31^0 + 2*31^1 = 63 (before mod).

6. [Analysis] Why trie can answer prefix count queries efficiently?
- Answer: Store passCount at each node; prefix count at end node.

7. [Scenario] Detect repeated substring length k many times in long text.
- Answer: Rolling hash + hash set over windows.

8. [Pseudo code] Prefix count in trie.
- Answer:
```text
insert(word): for each node visited, node.passCount++
count(prefix): traverse prefix, return node.passCount
```

9. [Simulation] Insert "aa", "ab", "abc". count("a")?
- Answer: 3.

10. [Theoretical reasoning] Why compressed trie (radix tree) saves memory?
- Answer: It merges single-child chains into one edge label.

---

## Fast Topic-Selection Guide (Exam)

- Need fastest key lookup: Hashing
- Need repeated min/max element: Binary Heap
- Need sorted set with balanced updates: AVL
- Need range queries with updates: Segment Tree
- Need static RMQ with huge queries: Sparse Table
- Need component connectivity merges: DSU
- Need prefix dictionary/autocomplete: Trie
- Need fast substring compare: String Hashing

---

## Missing-Coverage Check

All requested items are included for every topic:
- Theory: yes
- Example per topic: yes
- Diagram per topic: yes
- 30 questions per topic (10 easy, 10 medium, 10 difficult): yes
- Answers with every question: yes
- Required question styles (definition/analysis, scenario choice+use, pseudo code, simulation): yes
