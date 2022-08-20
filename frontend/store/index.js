import Vuex from "vuex";
import VuexPersistence from 'vuex-persist'
import { ResourceModule } from "./module/ResourceModule";

export const store = new Vuex.Store({
    
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    resource: ResourceModule,
  },
  plugins: [new VuexPersistence().plugin]
});
