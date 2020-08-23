# Sorting 

#Bubble Sort

def swap(i, j, arr)
  tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp
end


def my_sort(arr)
  i=0
  len = arr.size
  while(i < len - 1)
    j = i+1
    while(j < len)
      swap(i,j,arr) if arr[j] < arr[i]
      j+=1
    end
    puts "iteration i #{i}, arr #{arr}"
    i+=1
  end
  arr
end


def selection_sort(arr)
  i=0
  len = arr.size
  while(i < len - 1)
    j = i+1
    min = i
    while(j < len)
      min = j if arr[j] < arr[min]
      j+=1
    end
    swap(i,min,arr)
    puts "iteration i #{i}, arr #{arr}"
    i+=1
  end
  arr
end

#Sort numbers from largest to smallest
def selection_sort_reverse(arr)
  i=0
  len = arr.size
  while(i < len - 1)
    j = i+1
    max = i
    while(j < len)
      max = j if arr[j] > arr[max]
      j+=1
    end
    swap(i,max,arr)
    puts "iteration i #{i}, arr #{arr}"
    i+=1
  end
  arr
end


def bubble_sort(arr)
  i = 0 
  len = arr.size
  while (i < len)
    j = 0 
    swap_happened = false
    while (j < len - i - 1)
      swap(j,j+1,arr) && (swap_happened=true) if arr[j] > arr[j+1]
      j+=1
    end
    break unless swap_happened
    puts "iteration i #{i}, arr #{arr}"
    i+=1
  end
  arr
end


def insertion_sort(arr)
  i = 1
  len = arr.size
  while (i < len)
    j= i
    while (j > 0)
      swap(j, j-1, arr) if arr[j] < arr[j-1]
      j-=1
      break if arr[j] > arr[j-1]
    end
    i+=1
    puts "iteration i #{i}, arr #{arr}"
  end
  arr
end


def quicksort(arr)
  len = arr.size
  if len == 1
    return arr
  else 
    initiate_quicksort(arr, 0, len-1)
  end
  arr
end

def initiate_quicksort(arr, left, right)
  # puts "initiate_quicksort #{arr} left #{left} right #{right}"
  if left < right
    pi = partition_index(arr, left, right)
    # puts "pi index #{pi} -> arr #{arr}"
    initiate_quicksort(arr, left, pi-1)
    initiate_quicksort(arr, pi+1 , right)
  end
end

def partition_index(arr, left, right)
  i = left
  pivot_ele = arr[right]
  j = left
  while(j < right)
    if pivot_ele > arr[j]
      swap(i,j,arr)
      i+=1
    end
    j+=1
  end
  # p "before arr #{arr} i #{i}"
  swap(i, right, arr)
  # p "after arr #{arr} i #{i}"
  i
end



def merge_sort(arr)
  len = arr.size
  if len == 1
    return arr
  else
    start_merge_sort(arr, 0, len-1)
  end
  arr
end

def start_merge_sort(arr, left, right)
  # p "start_merge_sort left #{left} right #{right}"
  if left < right
    mid = (left+right)/2
    start_merge_sort(arr, left, mid)
    start_merge_sort(arr, mid+1, right)
    final_merge(arr, left, mid, right)
  end
end

def final_merge(arr, left, mid, right)
  # p "final_merge #{arr} left #{left} mid #{mid} right #{right}"
  i = left
  j= mid+1
  k =0
  b = []
  while (j <= right && i <= mid)
    arr[i] < arr[j] ? (b[k] = arr[i]; i+=1) : (b[k] = arr[j]; j+=1)
    k+=1
  end
  while(j <= right)
    b[k] = arr[j]
    j+=1
    k+=1
  end
  while(i <= mid)
    b[k] = arr[i]
    i+=1
    k+=1
  end
  i = right
  k-=1
  while(i >= left)
    arr[i] = b[k]
    k-=1
    i-=1
  end
end
