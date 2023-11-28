import { Controller } from 'stimulus';

export default class extends Controller {
  connect() {
    const data = this.data.get('data');
    this.renderChart(data);
  }

  renderChart(data) {
    new Chartkick.charts('chart', data);
  }
}