angular.module('freshigerator', [])

.controller('mainController', ->
  vm = this
  vm.test = 'hello world'
  
  vm.itemList = [
    {
    id: 1
    name: 'milk'
    exp: '2016-12-22'
    },
    {  
    id: 2
    name: 'eggs'
    exp: '2018-12-26'
    },
    {
    id: 3
    name: 'beef'
    exp: '2017-01-01'
    }
  ]
  
  vm.addItem = ->
    vm.isNewItemForm = true
  
  vm.removeItem = (item) ->
    index = vm.itemList.indexOf(item)
    vm.itemList.splice(index, 1)
  
  vm.submitNewItem = ->
    vm.isNewItemForm = false
    itemToAdd = {
      id: vm.itemList.length + 1
      name: vm.name
      exp: vm.exp
    }
    vm.itemList.push(itemToAdd)
    vm.name = null
    vm.exp = null
  
)

.directive('addItemForm', ->
  return {
    restrict: 'E',
    templateUrl: '/add_item_form.html'
  }
)



